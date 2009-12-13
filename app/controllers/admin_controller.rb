class AdminController < ApplicationController

  before_filter { |c| c.redirect_if_permission_less_than 7.0 }

  # Tally all percent votes (button on admin page)
  def tally_all
    @communities = Community.find(:all)
	  @communities.each do |community|
	    @rankings = Ranking.find(:all, :conditions => ["community_id = ?", community.id])
	    if @rankings.any?
	      community.tally
	    end
	  end
	redirect_to :action => :admin
  end

  # Set ballot_type for past votes (button on admin page)
  def set_ballot_types
    @votes = Vote.find(:all)
	  @votes.each do |vote|
	    # One-click voting started 2009-08-09, which in test data was id 247:
	    if vote.id > 246
	      vote.ballot_type = 0
	    # Before that, we had percent voting:
	    elsif vote.support
	      vote.ballot_type = 1
	    # Votes with no support were the earlier approval voting:
	    else
	      vote.ballot_type = -1
	    end
	    vote.save
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
