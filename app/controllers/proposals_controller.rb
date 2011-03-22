class ProposalsController < ApplicationController
  resource_controller
  load_and_authorize_resource

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
