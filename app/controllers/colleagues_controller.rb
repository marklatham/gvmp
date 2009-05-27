class ColleaguesController < ApplicationController
  resource_controller
  
  before_filter :redirect_unless_admin_user, :except => :index

  create.flash  "Colleague successfully created."
  update.flash  "Colleague was successfully updated."
  destroy.flash "Colleague removed."
  
  index.before do
    @colleagues = Colleague.find(:all, :order => "sequence, given_name, family_name")
  end
  
  # index.wants.yaml { render :yaml => collection }

end
