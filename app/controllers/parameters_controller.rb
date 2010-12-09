class ParametersController < ApplicationController
  resource_controller

  before_filter :except => :index do |c|
    c.redirect_if_permission_less_than 9.0
  end

  create.flash  "Parameter successfully created."
  update.flash  "Parameter was successfully updated."
  destroy.flash "Parameter removed."
  
  create.wants.html { redirect_to(parameters_path) }
  update.wants.html { redirect_to(parameters_path) }
  
  index.wants.yaml { render :yaml => collection }

end
