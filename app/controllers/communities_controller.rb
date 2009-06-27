class CommunitiesController < ApplicationController
  resource_controller

  before_filter :only => [:edit, :update] do |c|
    c.redirect_if_permission_less_than 4.0
  end

  before_filter :only => :destroy do |c|
    c.redirect_if_permission_less_than 7.0
  end

  create.flash  "Community successfully created."
  update.flash  'Community was successfully updated.'
  destroy.flash "Community removed."

  show.before do
    @rankings = @community.rankings.with_websites.paginate :page => params[:page], :per_page => 20
    @ballot = find_ballot
  end

  index.wants.yaml { render :yaml => collection }
  destroy.wants.html { redirect_back_or('/') }

  def collection
    scope = end_of_association_chain
    scope.paginate :page => params[:page]
  end

  def manage
    @communities = collection
  end

  def search
    @keywords = params[:q]
    @communities = Community.search(@keywords, :page => params[:page], :per_page => 30)
  end

  def add_to
    @community = Community.find(params[:id])
  end
  
  def add_to_update
    @community = Community.find(params[:id])

    respond_to do |format|
      if @community.update_attributes(params[:community])
        if @community.description.blank?
          @community.description = @community.add_to_description
        else
          @community.description = @community.description + '<br />' + @community.add_to_description
        end
        @community.add_to_description = ''
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
    
    vote = Vote.create!({:ip_address => @ip, :community_id => @community.id, :website_id => @website.id})

    @ballot = find_ballot
    @ballot.add_vote(vote)
    
    website_rank_in_community = Ranking.find(:first, :conditions => ["community_id = ? and website_id = ?", @community, @website])
    website_rank_in_community.rerank
    
    redirect_to :action => :show, :id => @community
  end

  private

    def find_ballot 
      session[:ballot] ||= Ballot.new 
    end

end
