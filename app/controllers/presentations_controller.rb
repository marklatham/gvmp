class PresentationsController < ApplicationController
  resource_controller
  load_and_authorize_resource

  create.flash  "Presentation successfully created."
  update.flash  "Presentation was successfully updated."
  destroy.flash "Presentation removed."
  
  index.before do
    @presentations = Presentation.order("pdate DESC")
  end

  create.wants.html { redirect_to(presentations_path) }
  update.wants.html { redirect_to(presentations_path) }

  index.wants.yaml { render :yaml => collection }

end