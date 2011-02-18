class ProposalsController < ApplicationController
  resource_controller

  before_filter :except => :index do |c|
    c.redirect_if_permission_less_than 7.0
  end

  create.flash  "Proposal successfully created."
  update.flash  "Proposal was successfully updated."
  destroy.flash "Proposal removed."
  
  index.before do
    @proposals = Proposal.order("date_submitted DESC")
  end

  create.wants.html { redirect_to(proposals_path) }
  update.wants.html { redirect_to(proposals_path) }

  index.wants.yaml { render :yaml => collection }

end
