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

  # Trim newlines \n and whitespace off the end of three fields:
  def clean_data
    @websites = Website.find(:all)
	  @websites.each do |website|
	    unless website.title.nil?
	      @title = website.title.chomp
	      website.title = @title.strip
	      website.save
	    end
	  end
    
    @communities = Community.find(:all)
	  @communities.each do |community|
	    unless community.name.nil?
	      @name = community.name.chomp
	      community.name = @name.strip
	    end
	    unless community.short_name.nil?
	      @short_name = community.short_name.chomp
	      community.short_name = @short_name.strip
	    end
	    community.save
	  end

	redirect_to :action => :admin
  end
  
end
