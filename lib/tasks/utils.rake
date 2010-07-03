namespace :utils do

  desc "Tally all percent votes"
  task(:tally_all => :environment) do
    @communities = Community.find(:all)
    @communities.each do |community|
      @rankings = Ranking.find(:all, :conditions => ["community_id = ?", community.id])
      if @rankings.any?
        community.tally
      end
    end
  end
  
  desc "Archive all website/blog rankings"
  task(:archive_rankings => :environment) do
    @rankings = Ranking.find(:all, :conditions => ["status != ?", "out"], :order => "id")
    @rankings.each do |ranking|
      ranking.archive
    end
  end
  
  desc "Create &/or update periodic (non-daily) past_rankings"
  task(:update_periodic_rankings => :environment) do
    
    @date_to_process = Date.today
    puts "Now processing data for this date: " + @date_to_process.to_s
    
    # Fold each daily ranking into its monthly and yearly rankings:
    @pr = PastRanking.find(:all, :conditions => ["period = ? and start = ?", "day", @date_to_process], :order => "id")
    @pr.each do |pr|
      pr.updatepr
    end
    
    # Update period past_rankings for which there are no corresponding daily past_rankings:
    @pr = PastRanking.find(:all, :conditions => ["period != ? and latest < ? and end >= ?",
                                                       "day", @date_to_process, @date_to_process], :order => "id")
    puts "Number of dropouts: " + @pr.size.to_s
    @pr.each do |pr|
      pr.update_dropout(@date_to_process)
    end
    
    # Sort and save monthly and yearly ranks in each community:
    @communities = Community.find(:all)
    puts "Number of communities: " + @communities.size.to_s
    @communities.each do |community|
      community.rankpr(@date_to_process)
    end
    
  end
  
  desc "Delete session records that are more than 30 days old"
  task(:delete_old_sessions => :environment) do
    
    sessions = Session.find(:all, :conditions => ["updated_at < ?", 1.month.ago])
    sessions.each do |session|
      session.delete
    end
    
  end

#########################################################################################
# Routines below here are one-off tasks not used in our online system, so OK to change:
#########################################################################################

  desc "Fill in new field in communities table"
  task(:fill => :environment) do
    
    communities = Community.find(:all)
    communities.each do |community|
      community.n_websites = community.websites.count
      community.save
    end
    
  end
  
  desc "Test some code"
  task(:test_code => :environment) do
    
    # Community-wide calculations of monthly and yearly ranks and shares:
    @communities = Community.find(:all)
    @communities.each do |community|
      community.calcpr
    end
    
  end
  
  desc "Bulk edit data"
  task(:edit_data => :environment) do
    
    @rankings = Ranking.find(:all, :conditions => ["status != ? OR status IS NULL", "limbo"])
    
    @rankings.each do |ranking|
      ranking.status = "in"
      ranking.save
    end
  end
  
  desc "Tag old votes to be ignored in community 82 UBC AMS"
  task(:oldvotes => :environment) do
    
    @votes = Vote.find(:all, :conditions => ["community_id = ? and (place = ? or place IS NULL)", "82", ""])
    
    @votes.each do |vote|
      vote.place = "old"
      vote.save
    end
  end
  
  desc "Fill in 3 new fields in past_rankings table"
  task(:fillpastrankings => :environment) do
    
    @pr = PastRanking.find(:all)
    
    @pr.each do |pr|
      pr.latest = pr.start
      pr.save
    end
  end
  
end