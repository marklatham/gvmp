class AdminController < ApplicationController

  before_filter { |c| c.redirect_if_permission_less_than 7.0 }

  # Recalculate all rankings (button on admin page)
  def rerank_all
    @rankings = Ranking.find(:all)
	
	  @rankings.each do |ranking|
	    ranking.rerank
	  end

	redirect_to :action => :admin
  end
  
end
