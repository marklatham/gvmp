class PubsController < ApplicationController
  resource_controller

  before_filter :redirect_unless_admin_user, :except => :index

  create.flash  "Publication successfully created."
  update.flash  "Publication was successfully updated."
  destroy.flash "Publication removed."
  
  index.before do
    @pubs = Pub.find(:all, :order => "date_sequence DESC")
  end
  
  index.wants.yaml { render :yaml => collection }

end
