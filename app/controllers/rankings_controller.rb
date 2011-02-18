class RankingsController < ApplicationController

  before_filter :except => :show do |c|
    c.redirect_if_permission_less_than 7.0
  end

  def index
    @rankings = Ranking.order("community_id, rank")
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rankings }
      format.yaml  { render :yaml => @rankings }
    end
  end

  def show
    @ranking = Ranking.find(params[:id])
    @website = Website.find(@ranking.website_id)
    @community = Community.find(@ranking.community_id)
    @daily_rankings = PastRanking.where("ranking_id = ? and period = ?", params[:id], "day").order("start DESC")
    @monthly_rankings = PastRanking.where("ranking_id = ? and period = ?", params[:id], "month").order("start DESC")
    @yearly_rankings = PastRanking.where("ranking_id = ? and period = ?", params[:id], "year").order("start DESC")
    @fundings = Funding.where("community_id = ?", @ranking.community_id).order("date DESC")
 
    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @past_rankings }
      format.yaml  { render :yaml => @past_rankings }
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
