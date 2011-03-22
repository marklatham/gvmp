class ClippingsController < ApplicationController
  resource_controller
  load_and_authorize_resource

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