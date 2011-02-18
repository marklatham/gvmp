class PresentationsController < ApplicationController
  resource_controller

  before_filter :except => :index do |c|
    c.redirect_if_permission_less_than 7.0
  end

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