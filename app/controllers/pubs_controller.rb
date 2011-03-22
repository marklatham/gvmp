class PubsController < ApplicationController
  resource_controller
  load_and_authorize_resource

  create.flash  "Publication successfully created."
  update.flash  "Publication was successfully updated."
  destroy.flash "Publication removed."
  
  index.before do
    @pubs = Pub.order("date_sequence DESC")
  end
  
  create.wants.html { redirect_to(pubs_path) }
  update.wants.html { redirect_to(pubs_path) }

  index.wants.yaml { render :yaml => collection }

end
