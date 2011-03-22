class VideosController < ApplicationController
  resource_controller
  load_and_authorize_resource

  # When we have enough videos, pretty up the index page and allow public access to it too.

  create.flash  "Video successfully created."
  update.flash  "Video was successfully updated."
  destroy.flash "Video removed."
  
  index.wants.yaml { render :yaml => collection }

end
