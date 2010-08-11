namespace :utils do

  desc "Set all community.tallied_at to restart tallying from then"
  task(:start_date => :environment) do
    communities = Community.find(:all, :order => "id")
    communities.each do |community|
      community.tallied_at = "2010-06-30 16:59:59" # This will make all time zones tally next for 2010-07-01
      community.save
    end
  end
  
  desc "Tally and update rankings for communities that need it"
  task(:tally_update => :environment) do
    
    # Designed to be run once an hour: daily tally update for communities that need it --
    # usually those in the time zone that just passed midnight.
    # If the server was down for a while, this will catch up one day every hour.
    # For back-filling, run this once per day of back-fill needed:
   1.times {
    
    puts Time.now.to_s + " Finding communities that need tallying."
    communities = Community.find(:all, :order => "tallied_at, id")
    communities.each do |community|
        
      puts "=============================== "  + community.id.to_s + ": " + community.name + " =========================="
      puts Time.now.to_s + " Time to tally?"
      # Check to see if it's time to tally this community:
      Time.zone = community.time_zone
      puts "Time zone: " + Time.zone.to_s
      puts "Last tally cutoff: " + community.tallied_at.in_time_zone.to_s
      tally_cutoff = 36.hours.from_now(community.tallied_at).in_time_zone.beginning_of_day
      puts "Next tally cutoff: " + tally_cutoff.to_s
      if 23.hours.from_now(community.tallied_at) > tally_cutoff
        puts "Warning: Tally interval looks too short!"
      end
      if 25.hours.from_now(community.tallied_at) < tally_cutoff
        puts "Warning: Tally interval looks too long!"
      end
      
      if tally_cutoff > Time.now
        puts "Too soon to tally, so skipping this community."
      else
        puts "OK, time to tally."
        
        # Whether or not there are rankings, make sure there are no leftover past_rankings for this date:
        tally_cutoff_date = 12.hours.ago(tally_cutoff).to_date
        n_deleted = PastRanking.delete_all(["community_id = ? and period = ? and start = ?",
                                                 community.id,       "day", tally_cutoff_date])
        if n_deleted > 0
          puts "Warning: There were already " + n_deleted.to_s + " past rankings for community " + community.id.to_s +
                " on date " + tally_cutoff_date.to_s + ". So they are now deleted."
        end
        
        # Make sure any funding allocation totals are reset to 0:
        fundings = Funding.find(:all, :conditions => ["community_id = ? and date = ?", community.id, tally_cutoff_date])
        fundings.each do |funding|
          if funding.allocated != 0
            puts "Warning: Funding id " + funding.id.to_s + " was already "
                                        + funding.allocated.to_s + "% allocated. Resetting to 0%."
            funding.allocated = 0
            funding.save
          end
        end
        
        # Get rankings for this community as of datetime tally_cutoff:
        rankings = Ranking.find(:all, :conditions => ["community_id = ? and created_at < ? and dropped_at > ?",
                                                     community.id,      tally_cutoff,      tally_cutoff], :order => "website_id")
        if rankings.any?
          
          puts "Found " + rankings.size.to_s + " rankings as of tally cutoff."
          
          community.tally(tally_cutoff, rankings)
          
          # Prepare to archive the newly tallied rankings; first, find them: [Or should this be returned from community.tally?]
          rankings = Ranking.find(:all, :conditions => ["community_id = ? and created_at < ? and dropped_at > ?",
                                                     community.id,      tally_cutoff,      tally_cutoff], :order => "website_id")
          rankings.each do |ranking|
            ranking.archive(tally_cutoff_date, fundings)
          end
          
          puts "Next we will calculate and store periodic past rankings."
          community.calc_periodic_rankings(tally_cutoff_date)
          # [Should we skip this calc when back-filling for many days? Using a counting loop within main routine?
          #  But if multi-period then it gets trickier...]
          
        else
          puts "But there are no rankings to tally. Nonetheless, we deleted any leftover past_rankings for this date & "
          puts "community, set any funding allocations to 0%, and moved the tallied_at date forward."
        end
        
        community.tallied_at = tally_cutoff # This field is updated even if there were no rankings.
        community.save
        
      end
      Time.zone = "Pacific Time (US & Canada)"
      puts ""
    end
    puts "=============================== TALLY UPDATE COMPLETED =========================="
    puts "================================================================================="
   }
  end
  
  desc "Check n_websites for each community; update if needed:"
  task(:count_websites => :environment) do
    puts Time.now.to_s + " Checking n_websites for all communities."
    communities = Community.find(:all)
    communities.each do |community|
      check_n_websites = Ranking.count(:conditions => ["community_id = ? and dropped_at > ?", community.id, Time.now])
      unless community.n_websites == check_n_websites
        puts "Updating n_websites for " + community.name + " from " + community.n_websites.to_s +
             " to " + check_n_websites.to_s
        puts "Ranking ids:"
        rankings = Ranking.find(:all, :conditions => ["community_id = ? and dropped_at > ?", community.id, Time.now])
        rankings.each do |ranking|
          print ranking.id.to_s + ", "
        end
        puts " "
        community.n_websites = check_n_websites
        community.save
      end
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