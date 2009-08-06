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
  end

  index.wants.yaml { render :yaml => collection }
  create.wants.html { redirect_to community_path(@community) }
  destroy.wants.html { redirect_back_or('/') }
end
