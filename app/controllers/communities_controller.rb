class CommunitiesController < ApplicationController
  resource_controller

  create.flash  "Community successfully created."
  update.flash  'Community was successfully updated.'
  destroy.flash "Community removed."

  show.before do
    @rankings = @community.rankings.with_websites
  end

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
