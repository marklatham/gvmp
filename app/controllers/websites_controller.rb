class WebsitesController < ApplicationController
  resource_controller
  load_and_authorize_resource
  belongs_to :community

  create.before do
    @website.creator_ip = request.remote_ip
  end

  create.after do
    @community.websites << @website
    @community.n_websites = Ranking.where("community_id = ? and dropped_at > ?", @community.id, Time.now).count
    @community.save
    
    ranking = Ranking.where("community_id = ? and website_id = ?", @community.id, @website.id).order("created_at").last
    ranking.rank = @community.n_websites
    ranking.save
    
  end

  destroy.after do
    # I don't think this really works, does it? When we destroy a website record,
    # will the associated rankings record(s) also be destroyed?? :
    @community.n_websites = Ranking.where("community_id = ? and dropped_at > ?", @community.id, Time.now).count
    @community.save
  end

  index.wants.yaml { render :yaml => collection }
  create.wants.html { redirect_to community_path(@community) }
  destroy.wants.html { redirect_back_or('/') }
end
