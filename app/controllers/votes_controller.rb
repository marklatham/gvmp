class VotesController < ApplicationController
  resource_controller

  before_filter do |c|
    c.redirect_if_permission_less_than 8.5
  end

  index.before do
    @votes = Vote.order("id DESC").limit(600)
  end
  
  def summary
    @votes = Vote.order("id DESC").limit(600)
    respond_to do |format|
      format.html
      format.yaml { render :yaml => @votes }
    end
  end
  
  create.flash  "Vote successfully created."
  update.flash  "Vote was successfully updated."
  destroy.flash "Vote removed."

  index.wants.yaml { render :yaml => collection }

end
