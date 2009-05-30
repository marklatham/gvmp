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
    @rankings = @community.rankings.with_websites
  end
  
  # index.wants.yaml { render :yaml => collection }

  # TODO: should be done on a votes controller
  def vote_for_website
    @ip = request.remote_ip
    @website = Website.find(params[:id])
    @community = Community.find(params[:community])
    
    Vote.create!({:ip_address => @ip, :community_id => @community.id, :website_id => @website.id})
    
    website_rank_in_community = Ranking.find(:first, :conditions => ["community_id = ? and website_id = ?", @community, @website])
    website_rank_in_community.rerank
    
    redirect_to :action => :show, :id => @community
  end

end
