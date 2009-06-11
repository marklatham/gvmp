
class WelcomeController < ApplicationController
  def index
    @communities = Community.paginate :page => params[:page], :order => 'country, category, name'
  end
end
