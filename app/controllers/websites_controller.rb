class WebsitesController < ApplicationController
  resource_controller

  before_filter :only => [:edit, :update] do |c|
    c.redirect_if_permission_less_than 4.0
  end

  before_filter :only => [:index, :destroy] do |c|
    c.redirect_if_permission_less_than 5.0
  end

  index.before do
    @websites = Website.find(:all, :order => "id DESC")
  end
  
  index.wants.yaml { render :yaml => collection }

  new_action.before do
    @community = Community.find(params[:community_id])
  end

  create.before do
    @community = Community.find(params[:community_id])
  end
  
  create.wants.html { redirect_to :controller => 'communities', :action => 'show', :id => @community.id }

  private

  def build_object
    @object ||= end_of_association_chain.build_for_community(params[:community_id], object_params)
  end

end
