class ColleaguesController < ApplicationController
  resource_controller
  
  before_filter do |c|
    c.redirect_if_permission_less_than 7.0
  end

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
