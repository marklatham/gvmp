class FaqsController < ApplicationController
  resource_controller

  before_filter :except => :index do |c|
    c.redirect_if_permission_less_than 7.0
  end

  create.flash  "Faq successfully created."
  update.flash  "Faq was successfully updated."
  destroy.flash "Faq removed."
  
  index.before do
    @faqs = Faq.find(:all, :order => "sequence")
  end
  
  index.wants.yaml { render :yaml => collection }

end
