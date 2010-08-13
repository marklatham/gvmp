class CommunitiesController < ApplicationController
  # before_filter :only => [:edit, :update] do |c|
  before_filter :only => [:new, :create, :edit, :update] do |c|
    c.redirect_if_permission_less_than 4.0
  end

  before_filter :only => :destroy do |c|
    c.redirect_if_permission_less_than 7.0
  end

  before_filter :only => :fund do |c|
    c.redirect_if_permission_less_than 9.0
  end

  def index
    @communities = Community.filter(params)
    respond_to do |format|
      format.html
      format.yaml { render :yaml => @communities }
    end
  end

  def manage
    @communities = Community.filter(params.merge(:sorted => 'recently_created'))
  end
  
  def show 
    unless @community = Community.find_by_idstring(params[:idstring])
      @community = Community.find(params[:id])
    end
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
      notify('Community was successfully updated.', :success)
      redirect_to @community 
    else
      render_invalid_update(@community)
    end
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    notify('Community removed.', :info)
    redirect_back_or('/')
  end

  def add_to
    @community = Community.find(params[:id])
  end
  
#  Commented out because we were getting spammed. Reactivate when we get spam screens in place: 
#  def add_to_update
#    @ip = request.remote_ip
#    @community = Community.find(params[:id])

#    respond_to do |format|
#      if @community.update_attributes(params[:community])
#        if @community.description.blank?
#          @community.description = @community.add_to_description
#        else
#          @community.description = @community.description + '<br />' + @community.add_to_description
#        end
#        @community.add_to_description = ''
#        @community.adder_ip = @ip
#        @community.save
#        flash[:notice] = 'Community data was successfully added.'
#        format.html { redirect_to(@community) }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "add_to" }
#        format.xml  { render :xml => @community.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

  def fund
    @community = Community.find(params[:id])
  end
  
  def create_fundings
    @community = Community.find(params[:community])
    @date = build_date_from_params(:start_date, params[:funding])
    @amount = params[:amount]
    @end_date = @date + params[:days].to_i
    
    while @date < @end_date do
      Funding.create!({:date => @date, :community_id => @community.id, :amount => @amount})
      @date += 1
    end
    
    redirect_to :action => :show, :id => @community
  end
  
  # Reconstruct a date object from date_select helper form params
  def build_date_from_params(field_name, params)
    Date.new(params["#{field_name.to_s}(1i)"].to_i,
        params["#{field_name.to_s}(2i)"].to_i,
        params["#{field_name.to_s}(3i)"].to_i)
  end
  
  
  # TODO: should be done on a votes controller
  def vote_for_website
    @ip = request.remote_ip
    @agent = request.user_agent
    @website = Website.find(params[:id])
    @community = Community.find(params[:community])
    @support = params[:percent].to_f
    if @support > 100
      @support = 100
    end
    if @support < 0
      @support = 0
    end
    
    if @place = Place.find(:first, :conditions => ["? LIKE ip_string", @ip])
      @name = @place.name
    else
      @name = nil
    end
    
    #First we delete the old votes
    delete_vote(@community, @website, @ip)
    
    vote = Vote.create!({:ip_address => @ip, :agent => @agent, :community_id => @community.id,
                         :website_id => @website.id, :support => @support, :ballot_type => "2", :place => @name})

    @ballot = find_ballot
    @ballot.add_vote(vote)

    respond_to do |format|
      format.html { redirect_to :action => :show, :id => @community}
      format.js
    end
  end
  
  def submit_feedback
    @ip = request.remote_ip
    @agent = request.user_agent
    @community = Community.find(params[:community])
    @comment = params[:comment]
    
    Feedback.create!({:community_id => @community.id, :comment => @comment, :ip_address => @ip, :agent => @agent})

    notify "Thanks for your comment!"
    redirect_to :action => :show, :id => @community
  end
  
  def debug
    # This is a copy of the tally method in model/community, with the following line inserted...
    @community = Community.find(params[:id])
    # ... and "self" replaced by "@community" in the rest of the code.
    # Can we get rid of this duplication of code?
    
    # Can replace "while" with "if" to watch iterations.
    
    # INSERT CODE HERE, THEN REPLACE "self" by "@community"
    
  end

  # Subroutine to count the number of (time-decayed) votes for shares >= cutoff = ranking.share + increment
  # This is also duplicated from model/community -- how to DRY this up?
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

  def horserace
    
    @community = Community.find(params[:id])
    @master_rankings = PastRanking.find(:all, :conditions => ["community_id = ? and period = ? and start >= ? and share > 0",
                                                    params[:id], "year", Date.today.beginning_of_year], :order => "share DESC")
    @earliest_month = PastRanking.find(:first, :conditions => ["community_id = ? and period = ?",
                                                                     params[:id],        "month"], :order => "start")
    @latest_month = PastRanking.find(:first, :conditions => ["community_id = ? and period = ?",
                                                                     params[:id],        "month"], :order => "start DESC")
    @earliest_day = PastRanking.find(:first, :conditions => ["community_id = ? and period = ?",
                                                                     params[:id],        "day"], :order => "start")
    @latest_day = PastRanking.find(:first, :conditions => ["community_id = ? and period = ?",
                                                                     params[:id],        "day"], :order => "start DESC")
  end

  private

  def find_ballot 
    session[:ballot] ||= Ballot.new 
  end
  
  def delete_vote (community, website, ip)
    @ballot = find_ballot
    @ballot.destroy_click(community.id, website.id)
  end

end
