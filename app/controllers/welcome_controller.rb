class WelcomeController < ApplicationController
  # GET /communities
  # GET /communities.xml
  def index
#    @communities = Community.find(:all, :order => "country, category, name")
#    The above works, but not the below with ferret:
    @communities = Community.find_with_ferret("Canada")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @communities }
    end
  end

end
