class Community < ActiveRecord::Base
  # TODO: protect attributes from mass-assignment
  # counter-cache for number of websites
  
  has_many :rankings do
    def with_websites
      map{|ranking| { :rank => ranking.rank, :created_at => ranking.created_at,
                      :website => ranking.website, :share => ranking.share, :status => ranking.status,
                      :count0 => ranking.count0, :count1 => ranking.count1, :ranking_id => ranking.id }}.sort_by {
                      |website_and_ranking| [website_and_ranking[:rank]] }
    end
  end
  has_many :websites, :through => :rankings
  has_many :fundings
  has_many :feedbacks

  validates_presence_of :name, :short_name
  validates_presence_of :category, :message => "(Type) can't be blank"
  validates_length_of :name, :maximum => 50
  validates_length_of :short_name, :maximum => 20, :message => ": please shorten to 20 characters or less"
  validates_length_of :category, :maximum => 20
  validates_length_of :country, :maximum => 30
  validates_length_of :prov_state, :maximum => 30
  validates_length_of :city, :maximum => 30

  named_scope :recently_created, :order => 'communities.created_at DESC'
  named_scope :recently_updated, :order => 'communities.updated_at DESC'


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

    # Found example at http://stackoverflow.com/questions/1129792/rails-active-record-find-in-conjunction-with-order-and-group
    # but unsure how to code with just one query, so used naive way with too many queries:

    # This almost works, but returns the first record of each group (by ID, regardless of how sorted)
    # while we want the latest record:
    @votes = Vote.find(:all, :conditions => ["community_id = ? and (place = ? or place IS NULL)", self.id, ""],
                       :order => "website_id, ip_address, created_at DESC", :group => "website_id, ip_address")    
    # So this finds last record in each group:
    @votes.each do |vote|
      temp = Vote.find(:last, :conditions => ["community_id = ? and website_id = ? and ip_address = ?",
                                                         self.id, vote.website_id, vote.ip_address], :order => "created_at")
      vote.created_at = temp.created_at
      vote.support = temp.support
      vote.ballot_type = temp.ballot_type
    end
    
    @rankings = Ranking.find(:all, :conditions => ["community_id = ? and status = ?", self.id, "in"], :order => "website_id")
    
    # ranking.status = limbo means website hasn't entered contest but
    # we want to show it at bottom of ballot, at least temporarily.
    
    # We should move this test from tally_all into tally: if @rankings.any? Because what if all in limbo?
    
    # debug: puts @rankings.size

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
      
      @rankings = Ranking.find(:all, :conditions => ["community_id = ? and status = ?", self.id, "in"], :order => "website_id")
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
      
      @rankings = Ranking.find(:all, :conditions => ["community_id = ? and status = ?", self.id, "in"], :order => "website_id")
      @max_count1 = @rankings.max {|a,b| a.count1 <=> b.count1 }
      @rankings_pos = @rankings.find_all {|r| r.share > 0.0 }
      @min_count0 = @rankings_pos.min {|a,b| a.count0 <=> b.count0 }
    end

    # Main loop: Adjust shares until max_count1 <= min_count0 i.e. find a cutoff number of votes (actually a range of cutoffs)
    # where shares sum to 100.0 using that same cutoff to determine each website's share.
    # This is like a stock market order matching system. Each count1 is a bid; each count0 is an offer.
    # If the highest bid is higher than the lowest offer, then a trade of 1% happens.
    # It's a competitive market for public goods:
    
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
      
      @rankings = Ranking.find(:all, :conditions => ["community_id = ? and status = ?", self.id, "in"], :order => "website_id")
      @rankings_pos = @rankings.find_all {|r| r.share > 0.0 }
      @min_count0 = @rankings_pos.min {|a,b| a.count0 <=> b.count0 }
      @max_count1 = @rankings.max {|a,b| a.count1 <=> b.count1 }
    end

    @rankings = Ranking.find(:all, :conditions => ["community_id = ? and status = ?", self.id, "limbo"], :order => "website_id")
    @rankings.each do |ranking|
      ranking.share = 0.0
      ranking.count0 = countVotes(@votes, ranking, 0.0)
      ranking.count1 = countVotes(@votes, ranking, 1.0)
      ranking.save
    end

    # Share calculations are now completed, so store rank of each website in this community:
    
    @rankings = Ranking.find(:all, :conditions => ["community_id = ? and status = ?", self.id, "in"],
                             :order => "share DESC, count1 DESC, created_at DESC")
    rank_sequence = 0
    @rankings.each do |ranking|
      rank_sequence += 1
      ranking.rank = rank_sequence
      ranking.save
    end
    
    @rankings = Ranking.find(:all, :conditions => ["community_id = ? and status = ?", self.id, "limbo"],
                             :order => "count1 DESC, created_at DESC")
    @rankings.each do |ranking|
      rank_sequence += 1
      ranking.rank = rank_sequence
      ranking.save
    end

  end

  # Subroutine to count the number of (time-decayed) votes for shares >= cutoff = ranking.share + increment
  def countVotes(votes, ranking, increment)
    days_full_value = 10
    days_valid = 60
    ranking_formula_denominator = 50
    cutoff = ranking.share + increment
    
    count = 0.0
    votes.each do |vote|
      if vote.website_id == ranking.website_id && vote.support
        
        # Time decay of vote:
        days_old = (Time.now.to_date - vote.created_at.to_date).to_i
        if days_old < days_full_value
          decayed_weight = 1.0
        elsif days_old < days_valid
          decayed_weight = (days_valid - days_old) / ranking_formula_denominator.to_f
        else
          decayed_weight = 0.0
        end
        
        if decayed_weight > 0.0
        
          if vote.ballot_type == 2
            # ballot_type 2 is Interpolated Consensus with 5% increments:
            if vote.support < 0.1
              # This is to catch the special case of vote.support = 0.0 -- no interpolation.
              if cutoff < 0.1
                support_fraction = 1.0
                # In case it's useful to see how many voted for 0.0
              else
                support_fraction = 0.0
              end
            elsif vote.support - 2.5 > cutoff
              support_fraction = 1.0
            elsif vote.support + 2.5 < cutoff
              support_fraction = 0.0
            else
              support_fraction = 0.2 * (vote.support + 2.5 - cutoff)
            end
            
          elsif vote.ballot_type == 1
            # ballot_type 1 is simple percent vote for vote.support:
            if vote.support >= cutoff
              support_fraction = 1.0
            else
              support_fraction = 0.0
            end
            
          elsif vote.ballot_type == 0
            # Ballot_type 0 means voted for "Increase Share" from vote.support = share when voted,
            # interpreted as uniform distribution of vote from vote.support to 100.0:
            if vote.support >= cutoff
              support_fraction = 1.0
            elsif vote.support >= 100.0 or cutoff > 100.0
              support_fraction = 0.0
            else
              support_fraction = (100.0 - cutoff)/(100.0 - vote.support)
            end
            
          else
            # No provision for other ballot types at this point:
            support_fraction = 0.0
            
          end
          
          count += decayed_weight * support_fraction
          
        end
      end
    end
    return count
  end

  # Update periodic (non-daily) past_rankings ranks for this community; also check totals:
  def rankpr(date_to_process)
    
    @monthly_rankings = PastRanking.find(:all, :conditions => ["community_id = ? and period = ? and start >= ? and start <= ?",
                            self.id, "month", date_to_process.beginning_of_month, date_to_process.end_of_month],
                            :order => "share DESC, count1 DESC")
    if @monthly_rankings.size > 0
      checkpr(@monthly_rankings)
    end
    
    @yearly_rankings = PastRanking.find(:all, :conditions => ["community_id = ? and period = ? and start >= ? and start <= ?",
                            self.id, "year", date_to_process.beginning_of_year, date_to_process.end_of_year],
                            :order => "share DESC, count1 DESC")
    if @yearly_rankings.size > 0
      checkpr(@yearly_rankings)
    end
    
  end
  
  def checkpr(period_rankings)
    
    rank_sequence = 0
    first_funds = period_rankings[0].funds
    total_deviations = 0.0
    total_awards = 0.0
    total_shares = 0.0
    period_rankings.each do |pr|
      rank_sequence += 1
      pr.rank = rank_sequence
      pr.save
      total_deviations += (pr.funds - first_funds).abs
      total_awards += pr.award
      total_shares += pr.share
    end
      
    if total_deviations > 0.09 # Should be 0.0 but concerned about roundoff.
      puts "Community number " + period_rankings[0].community_id.to_s + " " + period_rankings[0].period +
           "ly fundings deviate by" + total_deviations.to_s
    end
    
    if (total_awards - first_funds).abs > 0.09 # Should be 0.0 but concerned about roundoff.
      puts "Community number " + period_rankings[0].community_id.to_s + " " + period_rankings[0].period +
           "ly awards total $" + total_awards.to_s + " but first_funds = " + first_funds.to_s
    end
    
    if (total_shares - 100.0).abs > 0.09 # Should be 0.0 but concerned about roundoff.
      puts "Community number " + period_rankings[0].community_id.to_s + " " + period_rankings[0].period +
           "ly shares total " + total_shares.to_s + " but should = 100.0 -- rescaling all to fix this."
      
      # This fix is OK for when a community first has blogs added to it; also if a day is missed.
      if total_shares > 0.0
        period_rankings.each do |pr|
          pr.share *= 100.0/total_shares
          pr.save
        end
      end
      
    end
    
  end
  
  
  class << self
    def filter(params={})

      # TODO: Separate the sphinx search
      if params[:q]
        # Unfortunately, sphinx's search doesn't want to play nice with will_paginate
        return search(params[:q], :page => params[:page], :per_page => @@per_page)
      end

      scope = self
      if sorted = params[:sorted]
        sorted = sorted.downcase.to_sym
        scope = scope.send(sorted) if self.scopes.keys.include?(sorted)
      else
        scope = scope.scoped(:order => 'lower(country), lower(category), lower(name)') 
      end

      scope
    end
        

    # TODO: A community should be marked by admin as featured
    # Should be a named_scope eventually
    def featured
      ids = [82, 96, 94, 51, 52, 81, 5, 205, 3, 151, 116, 109, 223]
      find(:all, :conditions => ["id in (?)", ids]).sort{|a, b| ids.index(a.id) <=> ids.index(b.id)}
    end
  end

end
