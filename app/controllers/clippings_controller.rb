class ClippingsController < ApplicationController
  resource_controller

  before_filter :only => [:new, :create, :edit, :update, :destroy] do |c|
    c.redirect_if_permission_less_than 7.0
  end

  create.flash  "Clipping successfully created."
  update.flash  "Clipping was successfully updated."
  destroy.flash "Clipping removed."
  
  index.before do
    @clippings = Clipping.order("date_sequence DESC")
  end

  create.wants.html { redirect_to(clippings_path) }
  update.wants.html { redirect_to(clippings_path) }

  index.wants.yaml { render :yaml => collection }

end