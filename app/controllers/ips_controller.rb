class IpsController < ApplicationController
  resource_controller

  before_filter do |c|
    c.redirect_if_permission_less_than 9.0
  end
  
  def votes
    
    @ip = Ip.find_by_id(params[:id])
    
    @votes = Vote.find(:all, :conditions => ["ip_address = ?", @ip.ip_address], :order => "id DESC", :limit => "600")
    
  end
  
  create.flash  "Ip successfully created."
  update.flash  "Ip was successfully updated."
  destroy.flash "Ip removed."
  
  create.wants.html { redirect_to(ips_path) }
  update.wants.html { redirect_to(ips_path) }
  
  index.wants.yaml { render :yaml => collection }
end
