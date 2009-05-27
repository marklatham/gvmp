class VotesController < ApplicationController
  resource_controller
  
  before_filter :redirect_unless_admin_user

  create.flash  "Vote successfully created."
  update.flash  "Vote was successfully updated."
  destroy.flash "Vote removed."

  index.wants.yaml { render :yaml => collection }

end
