class RankingsController < ApplicationController

  before_filter :redirect_unless_admin_user

  def index
    @rankings = Ranking.find(:all, :order => "created_at DESC")
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rankings }
      format.yaml  { render :yaml => @rankings }
    end
  end


  # DELETE /rankings/1
  # DELETE /rankings/1.xml
  def destroy
    @ranking = Ranking.find(params[:id])
    @ranking.destroy

    respond_to do |format|
      format.html { redirect_to(rankings_url) }
      format.xml  { head :ok }
    end
  end

end
