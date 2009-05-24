class PubsController < ApplicationController
  resource_controller

  create.flash  "Publication successfully created."
  update.flash  "Publication was successfully updated."
  destroy.flash "Publication removed."
  
  index.before do
    @pubs = Pub.find(:all, :order => "date_sequence DESC")
  end
  
  index.wants.yaml { render :yaml => collection }

end
