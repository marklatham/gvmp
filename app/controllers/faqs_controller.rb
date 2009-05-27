class FaqsController < ApplicationController
  resource_controller

  before_filter :redirect_unless_admin_user, :except => :index

  create.flash  "Faq successfully created."
  update.flash  "Faq was successfully updated."
  destroy.flash "Faq removed."
  
  index.before do
    @faqs = Faq.find(:all, :order => "sequence")
  end
  
  index.wants.yaml { render :yaml => collection }

end
