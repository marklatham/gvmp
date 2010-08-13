class VideosController < ApplicationController
  resource_controller

  before_filter :except => :show do |c|
    c.redirect_if_permission_less_than 7.0
  end
  # When we have more than one video, pretty up the index page and allow public access to it too.

  create.flash  "Video successfully created."
  update.flash  "Video was successfully updated."
  destroy.flash "Video removed."
  
  index.wants.yaml { render :yaml => collection }

end
