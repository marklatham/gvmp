class LinksController < ApplicationController
  resource_controller
  load_and_authorize_resource

  index.before do
    @links = Link.order("title")
  end
  
  create.flash  "Link successfully created."
  update.flash  "Link was successfully updated."
  destroy.flash "Link removed."
  
  create.wants.html { redirect_to(links_path) }
  update.wants.html { redirect_to(links_path) }

  index.wants.yaml { render :yaml => collection }

end
