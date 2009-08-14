class PublicController < ApplicationController
  
  # GET /colleagues
  def about_contact
    @colleagues = Colleague.find(:all, :order => "sequence, given_name, family_name")
  end
  
  def comdump
    @communities = Community.find(:all, :order => "id")
    respond_to do |format|
      format.yaml { render :yaml => @communities }
    end
  end

end
