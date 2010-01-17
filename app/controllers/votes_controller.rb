class VotesController < ApplicationController
  resource_controller

  before_filter do |c|
    c.redirect_if_permission_less_than 8.5
  end

  index.before do
    @votes = Vote.find(:all, :conditions => ["ip_address != ?", "24.86.175.115"], :order => "created_at DESC", :limit => "200")
  end

  create.flash  "Vote successfully created."
  update.flash  "Vote was successfully updated."
  destroy.flash "Vote removed."

  index.wants.yaml { render :yaml => collection }

end
