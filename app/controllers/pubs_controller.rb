class PubsController < ApplicationController
  resource_controller

  before_filter :except => :index do |c|
    c.redirect_if_permission_less_than 7.0
  end

  create.flash  "Publication successfully created."
  update.flash  "Publication was successfully updated."
  destroy.flash "Publication removed."
  
  index.before do
    @pubs = Pub.find(:all, :order => "date_sequence DESC")
  end
  
  create.wants.html { redirect_to(pubs_path) }
  update.wants.html { redirect_to(pubs_path) }

  index.wants.yaml { render :yaml => collection }

end
