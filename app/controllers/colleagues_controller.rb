class ColleaguesController < ApplicationController
  resource_controller
  load_and_authorize_resource

  create.flash  "Colleague successfully created."
  update.flash  "Colleague was successfully updated."
  destroy.flash "Colleague removed."
  
  index.before do
    @colleagues = Colleague.order("sequence, given_name, family_name")
  end
  
  create.wants.html { redirect_to('/about_contact') }
  update.wants.html { redirect_to('/about_contact') }
  
  index.wants.yaml { render :yaml => collection }

end
