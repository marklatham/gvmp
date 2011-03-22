class ParametersController < ApplicationController
  resource_controller
  load_and_authorize_resource

  create.flash  "Parameter successfully created."
  update.flash  "Parameter was successfully updated."
  destroy.flash "Parameter removed."
  
  create.wants.html { redirect_to(parameters_path) }
  update.wants.html { redirect_to(parameters_path) }
  
  index.wants.yaml { render :yaml => collection }

end
