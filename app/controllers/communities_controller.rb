class CommunitiesController < ApplicationController
  before_filter :only => [:edit, :update] do |c|
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

  private

    def find_ballot 
      session[:ballot] ||= Ballot.new 
    end

end
