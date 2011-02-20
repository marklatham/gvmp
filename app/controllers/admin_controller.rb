class AdminController < ApplicationController

  before_filter { |c| c.redirect_if_permission_less_than 8.5 }

  # Tally all percent votes (button on admin page)
  def tally_all
    @communities = Community.all
    @communities.each do |community|
      @rankings = Ranking.where("community_id = ?", community.id)
      if @rankings.any?
        community.tally
      end
    end
    redirect_to :action => :admin
  end

  # Set ballot_type for past votes (button on admin page)
  def set_ballot_types
    @votes = Vote.all
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
    @websites = Website.all
    @websites.each do |website|
      unless website.title.nil?
        @title = website.title.chomp
        website.title = @title.strip
        website.save
      end
    end
    
    @communities = Community.all
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
  
  def shared_ips
    @votes_by_ip = Vote.group("ip_address").order("ip_address")
  end
  
  def terminal_create
    @location = params[:location]
    @access = params[:access]
    @connect = params[:connect]
    @machine = params[:machine]
    @notes = params[:notes]
    @ip = request.remote_ip
    @agent = request.user_agent
    
    Terminal.create!({:location => @location, :access => @access, :connect => @connect, :machine => @machine, :notes => @notes, :ip_address => @ip, :agent => @agent})
    
    notify "Terminal info saved."
    redirect_to :action => :admin
  end
  
end
