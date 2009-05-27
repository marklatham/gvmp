class AdminController < ApplicationController

  before_filter :redirect_unless_admin_user

  # Recalculate all rankings (button on admin page)
  def rerank_all
    @rankings = Ranking.find(:all)
	
	  @rankings.each do |ranking|
	    ranking.rerank
	  end

	redirect_to :action => :admin
  end
  
end
