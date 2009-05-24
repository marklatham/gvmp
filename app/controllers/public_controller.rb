class PublicController < ApplicationController
  
  # GET /colleagues
  def about_contact
    @colleagues = Colleague.find(:all, :order => "sequence, given_name, family_name")
  end
  
end
