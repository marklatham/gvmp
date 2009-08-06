class CommunitiesController < ApplicationController
  # before_filter :only => [:edit, :update] do |c|
  before_filter :only => [:new, :create, :edit, :update] do |c|
    c.redirect_if_permission_less_than 4.0
  end

  before_filter :only => :destroy do |c|
    c.redirect_if_permission_less_than 7.0
  end

  def index
    @communities = Community.filter(params)
  end

  def manage
    @communities = Community.filter_manage(params)
  end

  def show 
    @community = Community.find(params[:id])
    @rankings = @community.rankings.with_websites.paginate :page => params[:page], :per_page => 20
    @ballot = find_ballot
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(params[:community])
    @community.creator_ip = request.remote_ip
    if @community.save
      notify "Community successfully created."
      redirect_to @community
    else
      render_invalid_create(@community)
    end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])
    if @community.update_attributes(params[:community])
      notify 'Community was successfully updated.'
      redirect_to @community 
    else
      render_invalid_update(@community)
    end
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    notify "Community removed."
    redirect_back_or('/')
  end

  def add_to
    @community = Community.find(params[:id])
  end
  
  def add_to_update
    @ip = request.remote_ip
    @community = Community.find(params[:id])

    respond_to do |format|
      if @community.update_attributes(params[:community])
        if @community.description.blank?
          @community.description = @community.add_to_description
        else
          @community.description = @community.description + '<br />' + @community.add_to_description
        end
        @community.add_to_description = ''
        @community.adder_ip = @ip
        @community.save
        flash[:notice] = 'Community data was successfully added.'
        format.html { redirect_to(@community) }
        format.xml  { head :ok }
      else
        format.html { render :action => "add_to" }
        format.xml  { render :xml => @community.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  # TODO: should be done on a votes controller
  def vote_for_website
    @ip = request.remote_ip
    @website = Website.find(params[:id])
    @community = Community.find(params[:community])
    @support = params[:percent].to_f
    if @support > 100
      @support = 100
    end
    if @support < 0
      @support = 0
    end
    
    vote = Vote.create!({:ip_address => @ip, :community_id => @community.id, :website_id => @website.id, :support => @support})

    @ballot = find_ballot
    @ballot.add_vote(vote)

# Temporary fix because I couldn't figure out how not to count it as an approval vote when support = 0,
# so destroy it. Delete this section when percent tally algorithm deployed.
    if @support == 0
      @ballot.destroy_click(@community.id, @website.id)
    end
    
    redirect_to :action => :show, :id => @community
  end

  def delete_vote
    @ip = request.remote_ip
    @website = Website.find(params[:id])
    @community = Community.find(params[:community])

# I haven't figured out how to make @ballot.destroy_click delete the vote saved in session, so create this "cancel" coded vote:
    vote = Vote.create!({:ip_address => @ip, :community_id => @community.id, :website_id => @website.id, :support => "-16.8"})
    
    @ballot = find_ballot
    @ballot.add_vote(vote)
    @ballot.destroy_click(@community.id, @website.id)
    @ballot.destroy_click(@community.id, @website.id)

    redirect_to :action => :show, :id => @community
  end
  
  def debug
  # Should skip this if community has no websites/rankings or no votes, else probably get error.
  # TO DO: any vote for a share that's not a whole number percent should be split,
  # e.g. a vote for 26.4% should become 0.4 of a vote for 27% and 0.6 of a vote for 26%.
  # This algorithm doesn't handle tie votes "fairly": it gives all the tied share to the first website.
  # So should probably be enhanced some time to make it fairer. But this problem is not significant when there are many
  # votes and some are over 10 days old.
  
    days_full_value = 10
    days_valid = 60
    ranking_formula_denominator = 50
    
    @community = Community.find(params[:id])
    
    # How to select the latest vote from each IP address for each website?:

    # This doesn't get all data fields, so no good I guess:
    #    @votes = Vote.maximum(:updated_at, 
    #                               :conditions => ["community_id = ?", @community.id],                     
    #                               :group => "ip_address, website_id")    

    # Found example at http://stackoverflow.com/questions/1129792/rails-active-record-find-in-conjunction-with-order-and-group but...
    # Unsure how to code with just one query, so used naive way with too many queries:

    # This almost works, but returns the first record of each group (by ID, regardless of how sorted) while we want the latest record:
    @votes = Vote.find(:all, :conditions => ["community_id = ?", @community.id], :order => "website_id, ip_address, created_at DESC", :group => "website_id, ip_address")    
    # So this finds last record in each group (but even this doesn't work!):
    @votes.each do |vote|
      temp = Vote.find(:last, :conditions => ["community_id = ? and website_id = ? and ip_address = ?", @community.id, vote.website_id, vote.ip_address], :order => "created_at")
      vote.created_at = temp.created_at
      vote.support = temp.support
    end
    
    @rankings = Ranking.find(:all, :conditions => ["community_id = ?", @community.id], :order => "website_id")

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
    # (Should probably be put into a method to reduce repetitive coding below.)
    @rankings.each do |ranking|
      ranking.count0 = 0.0
      ranking.count1 = 0.0
      @votes.each do |vote|
        if vote.website_id == ranking.website_id && vote.support
          
          if vote.support >= ranking.share + 1.0
            days_old = (Time.now.to_date - vote.created_at.to_date).to_i
            if days_old < days_full_value
              ranking.count1 += 1.0
              ranking.count0 += 1.0
            elsif days_old < days_valid
              ranking.count1 += (days_valid - days_old) / ranking_formula_denominator.to_f
              ranking.count0 += (days_valid - days_old) / ranking_formula_denominator.to_f
            end
            
          elsif vote.support >= ranking.share
            days_old = (Time.now.to_date - vote.created_at.to_date).to_i
            if days_old < days_full_value
              ranking.count0 += 1.0
            elsif days_old < days_valid
              ranking.count0 += (days_valid - days_old) / ranking_formula_denominator.to_f
            end
          
          end
        end
      end
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
      @min_count0.count0 = 0.0
      @votes.each do |vote|
        if vote.website_id == @min_count0.website_id && vote.support
          if vote.support >= @min_count0.share
            days_old = (Time.now.to_date - vote.created_at.to_date).to_i
            if days_old < days_full_value
              @min_count0.count0 += 1.0
            elsif days_old < days_valid
              @min_count0.count0 += (days_valid - days_old) / ranking_formula_denominator.to_f
            end
          end
        end
      end
      @min_count0.save
      
      @rankings = Ranking.find(:all, :conditions => ["community_id = ?", @community.id], :order => "website_id")
      @max_count1 = @rankings.max {|a,b| a.count1 <=> b.count1 }
      @rankings_pos = @rankings.find_all {|r| r.share > 0.0 }
      @min_count0 = @rankings_pos.min {|a,b| a.count0 <=> b.count0 }
    end
    
    # If shares sum to less than 100 (e.g. when first website[s] added), increase 1 at a time:
    while @rankings.sum(&:share) < 100.0
      @max_count1.share += 1.0
      @max_count1.count0 = @max_count1.count1
      @max_count1.count1 = 0.0
      @votes.each do |vote|
        if vote.website_id == @max_count1.website_id && vote.support
          if vote.support >= @max_count1.share + 1.0
            days_old = (Time.now.to_date - vote.created_at.to_date).to_i
            if days_old < days_full_value
              @max_count1.count1 += 1.0
            elsif days_old < days_valid
              @max_count1.count1 += (days_valid - days_old) / ranking_formula_denominator.to_f
            end
          end
        end
      end
      @max_count1.save
      
      @rankings = Ranking.find(:all, :conditions => ["community_id = ?", @community.id], :order => "website_id")
      @max_count1 = @rankings.max {|a,b| a.count1 <=> b.count1 }
      @rankings_pos = @rankings.find_all {|r| r.share > 0.0 }
      @min_count0 = @rankings_pos.min {|a,b| a.count0 <=> b.count0 }
    end

    # Main loop: Adjust shares until max_count1 <= min_count0 i.e. find a cutoff number of votes (actually a range of cutoffs)
    # where shares sum to 100.0 using that same cutoff to determine each website's share:
    
    # Can change "while" to "if" and watch the iterations by refreshing /communities/debug/nn
    while @min_count0.count0 < @max_count1.count1
      # Move one percent share from @min_count0 to @max_count1
      
      @min_count0.share -= 1.0
      @min_count0.count1 = @min_count0.count0
      @min_count0.count0 = 0.0
      @votes.each do |vote|
        if vote.website_id == @min_count0.website_id && vote.support
          if vote.support >= @min_count0.share
            days_old = (Time.now.to_date - vote.created_at.to_date).to_i
            if days_old < days_full_value
              @min_count0.count0 += 1.0
            elsif days_old < days_valid
              @min_count0.count0 += (days_valid - days_old) / ranking_formula_denominator.to_f
            end
          end
        end
      end
      @min_count0.save
      
      @max_count1.share += 1.0
      @max_count1.count0 = @max_count1.count1
      @max_count1.count1 = 0.0
      @votes.each do |vote|
        if vote.website_id == @max_count1.website_id && vote.support
          if vote.support >= @max_count1.share + 1.0
            days_old = (Time.now.to_date - vote.created_at.to_date).to_i
            if days_old < days_full_value
              @max_count1.count1 += 1.0
            elsif days_old < days_valid
              @max_count1.count1 += (days_valid - days_old) / ranking_formula_denominator.to_f
            end
          end
        end
      end
      @max_count1.save
      
      @rankings = Ranking.find(:all, :conditions => ["community_id = ?", @community.id], :order => "website_id")
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

    respond_to do |format|
      format.html # debug.html.erb
    end
  end


  private

    def find_ballot 
      session[:ballot] ||= Ballot.new 
    end

end
