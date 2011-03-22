class FaqsController < ApplicationController
  resource_controller
  load_and_authorize_resource

  create.flash  "Faq successfully created."
  update.flash  "Faq was successfully updated."
  destroy.flash "Faq removed."
  
  create.wants.html { redirect_to(faqs_path) }
  update.wants.html { redirect_to(faqs_path) }
  
  index.wants.yaml { render :yaml => collection }

end
