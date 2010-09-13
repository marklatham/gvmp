class WebsitesController < ApplicationController
  resource_controller
  belongs_to :community

  before_filter :only => [:new, :create, :edit, :update] do |c|
    c.redirect_if_permission_less_than 4.0
  end

  before_filter :only => [:index, :destroy] do |c|
    c.redirect_if_permission_less_than 5.0
  end

  create.before do
    @website.creator_ip = request.remote_ip
  end

  create.after do
    @community.websites << @website
    @community.n_websites = Ranking.count(:conditions => ["community_id = ? and dropped_at > ?", @community.id, Time.now])
    @community.save
    
    ranking = Ranking.find(:last, :conditions => ["community_id = ? and website_id = ?",
                                                        @community.id, @website.id], :order => "created_at")
    ranking.rank = @community.n_websites
    ranking.save
    
  end

  destroy.after do
    # I don't think this really works, does it? When we destroy a website record,
    # will the associated rankings record(s) also be destroyed?? :
    @community.n_websites = Ranking.count(:conditions => ["community_id = ? and dropped_at > ?", @community.id, Time.now])
    @community.save
  end

  index.wants.yaml { render :yaml => collection }
  create.wants.html { redirect_to community_path(@community) }
  destroy.wants.html { redirect_back_or('/') }
end
