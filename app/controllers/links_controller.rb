class LinksController < ApplicationController
  resource_controller

  before_filter :except => :index do |c|
    c.redirect_if_permission_less_than 7.0
  end

  index.before do
    @links = Link.find(:all, :order => "title")
  end
  
  create.flash  "Link successfully created."
  update.flash  "Link was successfully updated."
  destroy.flash "Link removed."
  
  index.wants.yaml { render :yaml => collection }

end
