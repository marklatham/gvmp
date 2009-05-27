class RankingsController < ApplicationController

  before_filter :redirect_unless_admin_user

  def index
    @rankings = Ranking.find(:all, :order => "id")
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rankings }
      format.yaml  { render :yaml => @rankings }
    end
  end

end
