class IpsController < ApplicationController
  resource_controller
  load_and_authorize_resource

  def votes
    
    @ip = Ip.find_by_id(params[:id])
    
    @votes = Vote.where("ip_address = ?", @ip.ip_address).order("id DESC").limit(600)
    
  end
  
  create.flash  "Ip successfully created."
  update.flash  "Ip was successfully updated."
  destroy.flash "Ip removed."
  
  create.wants.html { redirect_to(ips_path) }
  update.wants.html { redirect_to(ips_path) }
  
  index.wants.yaml { render :yaml => collection }
end
