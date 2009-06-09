class WelcomeController < ApplicationController
  # GET /communities
  # GET /communities.xml
  def index
    @communities = Community.find(:all, :order => "country, category, name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @communities }
    end
  end

end
