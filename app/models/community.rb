class Community < ActiveRecord::Base
  # TODO: protect attributes from mass-assignment
  
  has_many :rankings do
    def with_websites
      # sort first on rank, then on created_at; pass both values to caller
      map{|ranking| { :rank => ranking.rank, :created_at => ranking.created_at, :website => ranking.website, :share => ranking.share, :count0 => ranking.count0, :count1 => ranking.count1 }}.sort_by {
                      |website_and_ranking| [website_and_ranking[:share], website_and_ranking[:count1]] }.reverse
    end
  end
  has_many :websites, :through => :rankings

  default_scope :order => 'country, category, name'
# How to substitute this order when called from communities/manage ? Done crudely below by defining filter_manage.
#  default_scope :order => 'created_at DESC'. This works on my Mac but not at RailsPlayground!

  validates_presence_of :name, :short_name
  validates_presence_of :category, :message => "(Type) can't be blank"
  
  validates_length_of :name, :maximum => 50
  validates_length_of :short_name, :maximum => 20, :message => ": please shorten to 20 characters or less"
  validates_length_of :category, :maximum => 20
  validates_length_of :country, :maximum => 30
  validates_length_of :prov_state, :maximum => 30
  validates_length_of :city, :maximum => 30

  # Required by sphinx
  define_index do
    indexes name, short_name, category, country, prov_state, city, scope
    set_property :delta => true
  end

  cattr_reader :per_page
  @@per_page = 30

  def to_param
    short_name.blank? ? id : "#{id}-#{short_name.parameterize}"
  end

  def location
    "#{city} #{prov_state} #{country}"
  end
  
  def tally
  # Should skip this if community has no websites/rankings or no votes, else probably get error.
  # This algorithm doesn't handle tie votes "fairly": it gives all the tied share to the first website.
  # So should probably be enhanced some time to make it fairer. But this problem is not significant when there are many
  # votes and some are over 10 days old.
        
    # How to select the latest vote from each IP address for each website?:
    # This doesn't get all data fields, so no good I guess:
    #    @votes = Vote.maximum(:updated_at, 
    #                               :conditions => ["community_id = ?", self.id],                     
    #                               :group => "ip_address, website_id")    

    # Found example at http://stackoverflow.com/questions/1129792/rails-active-record-find-in-conjunction-with-order-and-group but...
    # Unsure how to code with just one query, so used naive way with too many queries:

    # This almost works, but returns the first record of each group (by ID, regardless of how sorted) while we want the latest record:
    @votes = Vote.find(:all, :conditions => ["community_id = ?", self.id], :order => "website_id, ip_address, created_at DESC", :group => "website_id, ip_address")    
    # So this finds last record in each group:
    @votes.each do |vote|
      temp = Vote.find(:last, :conditions => ["community_id = ? and website_id = ? and ip_address = ?", self.id, vote.website_id, vote.ip_address], :order => "created_at")
      vote.created_at = temp.created_at
      vote.support = temp.support
      vote.ballot_type = temp.ballot_type
    end
    
    @rankings = Ranking.find(:all, :conditions => ["community_id = ?", self.id], :order => "website_id")

    # Make sure shares are nonegative whole numbers, not all zero:
    @rankings.each do |ranking|
      ranking.share = ranking.share.round
      if ranking.share < 0.0
        ranking.share = 0.0
      end
      ranking.save
    end
    if @rankings.sum(&:share) <= 0.0
      @rankings.each do |ranking|
        ranking.share = 1.0
        ranking.save
      end
    end

    # Calculate count0 (# votes for share or more) and count1 (# votes for share+1 or more) for each ranking:
    @rankings.each do |ranking|
      ranking.count0 = countVotes(@votes, ranking, 0.0)
      ranking.count1 = countVotes(@votes, ranking, 1.0)
      ranking.save
    end
    
    # Need to adjust shares until they sum to 100.0 and max_count1 <= min_count0(for websites with positive shares).
    # @max_count1 is the ranking record for the website that most deserves to have its share increased.
    # @min_count0 is the ranking record for the website that most deserves to have its share decreased.
    
    @max_count1 = @rankings.max {|a,b| a.count1 <=> b.count1 }
    # Can only reduce a share if it's positive, so:
    @rankings_pos = @rankings.find_all {|r| r.share > 0.0 }
    @min_count0 = @rankings_pos.min {|a,b| a.count0 <=> b.count0 }
    # but if all shares = 0.0, @min_count0 is nil which gives error; hence prevented above.
    
    # If shares sum to more than 100 (which shouldn't happen, but just in case), decrease 1 at a time:
    while @rankings.sum(&:share) > 100.0
      @min_count0.share -= 1.0
      @min_count0.count1 = @min_count0.count0
      @min_count0.count0 = countVotes(@votes, @min_count0, 0.0)
      @min_count0.save
      
      @rankings = Ranking.find(:all, :conditions => ["community_id = ?", self.id], :order => "website_id")
      @max_count1 = @rankings.max {|a,b| a.count1 <=> b.count1 }
      @rankings_pos = @rankings.find_all {|r| r.share > 0.0 }
      @min_count0 = @rankings_pos.min {|a,b| a.count0 <=> b.count0 }
    end
    
    # If shares sum to less than 100 (e.g. when first website[s] added), increase 1 at a time:
    while @rankings.sum(&:share) < 100.0
      @max_count1.share += 1.0
      @max_count1.count0 = @max_count1.count1
      @max_count1.count1 = countVotes(@votes, @max_count1, 1.0)
      @max_count1.save
      
      @rankings = Ranking.find(:all, :conditions => ["community_id = ?", self.id], :order => "website_id")
      @max_count1 = @rankings.max {|a,b| a.count1 <=> b.count1 }
      @rankings_pos = @rankings.find_all {|r| r.share > 0.0 }
      @min_count0 = @rankings_pos.min {|a,b| a.count0 <=> b.count0 }
    end

    # Main loop: Adjust shares until max_count1 <= min_count0 i.e. find a cutoff number of votes (actually a range of cutoffs)
    # where shares sum to 100.0 using that same cutoff to determine each website's share:
    
    while @min_count0.count0 < @max_count1.count1
      # Move one percent share from @min_count0 to @max_count1
      
      @min_count0.share -= 1.0
      @min_count0.count1 = @min_count0.count0
      @min_count0.count0 = countVotes(@votes, @min_count0, 0.0)
      @min_count0.save
      
      @max_count1.share += 1.0
      @max_count1.count0 = @max_count1.count1
      @max_count1.count1 = countVotes(@votes, @max_count1, 1.0)
      @max_count1.save
      
      @rankings = Ranking.find(:all, :conditions => ["community_id = ?", self.id], :order => "website_id")
      @rankings_pos = @rankings.find_all {|r| r.share > 0.0 }
      @min_count0 = @rankings_pos.min {|a,b| a.count0 <=> b.count0 }
      @max_count1 = @rankings.max {|a,b| a.count1 <=> b.count1 }
    end

    # If needed: Code to initialize all shares to 0.0:
    #    @rankings = Ranking.find(:all)
    #    @rankings.each do |ranking|
    #      ranking.share = 0.0
    #      ranking.save
    #    end
  end

  # Subroutine to count the number of (time-decayed) votes for shares >= ranking.share + increment
  def countVotes(votes, ranking, increment)
    days_full_value = 10
    days_valid = 60
    ranking_formula_denominator = 50
    
    count = 0.0
    votes.each do |vote|
      if vote.website_id == ranking.website_id && vote.support
        
        if vote.support >= ranking.share + increment
          # This case is same regardless of ballot_type:
          support_fraction = 1.0
        elsif vote.ballot_type == 1
          # ballot_type 1 is simple percent vote for vote.support:
          support_fraction = 0.0
        elsif vote.ballot_type == 0
          # Default ballot_type 0 means voted for "Increase Share" from vote.support = share when voted,
          # interpreted as uniform distribution of vote from vote.support to 100.0:
          if vote.support >= 100.0 or ranking.share + increment > 100.0
            support_fraction = 0.0
          else
            support_fraction = (100.0 - ranking.share - increment)/(100.0 - vote.support)
          end
        else
          # No provision for other ballot types at this point:
          support_fraction = 0.0
        end
        
        # Time decay of vote:
        days_old = (Time.now.to_date - vote.created_at.to_date).to_i
        if days_old < days_full_value
          decayed_weight = 1.0
        elsif days_old < days_valid
          decayed_weight = (days_valid - days_old) / ranking_formula_denominator.to_f
        end
        
        count += decayed_weight * support_fraction
      end
    end
    return count
  end

  class << self
    def filter(params)
      scope = self
      if params[:q]
        # Unfortunately, sphinx's search doesn't want to play nice with will_paginate
        return search(params[:q], :page => params[:page], :per_page => @@per_page)
      end

      scope.paginate :page => params[:page]
    end
        
    def filter_manage(params)
      scope = self
      default_scope :order => 'created_at DESC'
      if params[:q]
        # Unfortunately, sphinx's search doesn't want to play nice with will_paginate
        return search(params[:q], :page => params[:page], :per_page => @@per_page)
      end

      scope.paginate :page => params[:page]
    end


    # TODO: A community should be marked by admin as featured
    # Should be a named_scope
    # Coding below causes error if any featured community ids are not in database.

    def featured
      ids = [51, 81, 5, 205, 82, 94, 3, 109, 191, 116, 223]
      communities = ids.inject( [] ) { |list, id| list << Community.find(id) }
    end
  end

end
