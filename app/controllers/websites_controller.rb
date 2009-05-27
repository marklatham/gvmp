class WebsitesController < ApplicationController
  resource_controller

  before_filter :redirect_unless_admin_user, :except => [:new, :create]

  new_action.before do
    @community = Community.find(params[:community_id])
  end

  index.wants.yaml { render :yaml => collection }

  private

  def build_object
    @object ||= end_of_association_chain.build_for_community(params[:community_id], object_params)
  end

end
