class WebsitesController < ApplicationController
  resource_controller

  before_filter :redirect_unless_admin_user, :except => [:new, :create]

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
