namespace :misc do
  
#########################################################################################
# Routines here are one-off manually run tasks not used in our online system, so OK to change:
#########################################################################################
  
  
  desc "Set all community.tallied_at to restart tallying from then"
  task(:start_date => :environment) do
    communities = Community.find(:all, :order => "id")
    communities.each do |community|
      community.tallied_at = "2010-06-30 16:59:59" # This will make all time zones tally next for 2010-07-01
      community.save
    end
  end
  
  
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
  
  
  desc "Fill in new field in communities table"
  task(:fill1 => :environment) do
    
    communities = Community.find(:all)
    communities.each do |community|
      community.n_websites = community.websites.count
      community.save
    end
    
  end
  
  
  desc "Fill in new field in communities table"
  task(:fill2 => :environment) do
    
    communities = Community.find(:all)
    puts communities.size
    communities.each do |community|
      community.tallied_at = "2010-07-02 03:21:21"
      community.save
    end
    
  end
  
  
  desc "Fill in new field in rankings table"
  task(:fill3 => :environment) do
    
    rankings = Ranking.find(:all)
    puts rankings.size
    rankings.each do |ranking|
      ranking.tallied_at = ranking.updated_at
      ranking.save
    end
    
  end
  
  
  desc "Fill in new field in votes table"
  task(:fill4 => :environment) do
    
    places = Place.find(:all, :order => "created_at DESC")
    places.each do |place|
      votes = Vote.find(:all, :conditions => ["ip_address LIKE ?", place.ip_string])
      votes.each do |vote|
        if vote.place == "old"
          vote.place_created_at = nil
          vote.place = ""
        else
          vote.place_created_at = place.created_at
        end
        vote.save
      end
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
  
  
  desc "Test some code"
  task(:tc => :environment) do
    
    ipa = "4.2.144.31"
    array = ipa.split('.')
    ipnum = 16777216*array[0].to_i + 65536*array[1].to_i + 256*array[2].to_i + array[3].to_i
    puts ipnum
  end
  
  
  desc "Test some more code"
  task(:tc2 => :environment) do
    
    ipnum = 67276831
    
    w = ( ipnum / 16777216 ).to_i % 256
    x = ( ipnum / 65536    ).to_i % 256;
    y = ( ipnum / 256      ).to_i % 256;
    z = ( ipnum            ).to_i % 256;
    
    puts w.to_s + "." + x.to_s + "." + y.to_s + "." + z.to_s
  end
  
  
  desc "Delete some data"
  task(:deldata => :environment) do
    
    GeoIp.destroy_all("id > 9999999999999")
    
  end
  
end