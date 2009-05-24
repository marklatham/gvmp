class Admin::VotesController < ApplicationController
  resource_controller

  create.flash  "Vote successfully created."
  update.flash  "Vote was successfully updated."
  destroy.flash "Vote removed."

  index.wants.yaml { render :yaml => collection }

end
