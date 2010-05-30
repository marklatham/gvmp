class FaqsController < ApplicationController
  resource_controller

  before_filter :except => :index do |c|
    c.redirect_if_permission_less_than 7.0
  end

  create.flash  "Faq successfully created."
  update.flash  "Faq was successfully updated."
  destroy.flash "Faq removed."
  
  index.wants.yaml { render :yaml => collection }

end
