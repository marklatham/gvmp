namespace :utils do

# Tasks below are in our cron jobs, which are grouped in files on RPG server directory /home/votermed/cron/ :
#  group1 runs hourly at hh:15 -- tasks utils:process_votes and utils:tally_updates
#  group2 runs hourly at hh:35 -- task feed:load (in update_feeds.rake)
#  group3 runs daily at 10:55 UTC = 3:55am Pacific -- tasks utils:delete_old_sessions, utils:count_websites, ts:in and ts:in:delta
  
  
  desc "For new votes, calculate vote.days; and make sure vote.ip_address has a record in Ips table."
  task(:process_votes => :environment) do
    
    start_time = Time.now
    puts  'Task utils:process_votes started [%s]'.%([start_time])
    
    votes = Vote.find(:all, :conditions => ["days IS NULL"], :order => "id")
    puts votes.size.to_s + " new votes"
    
    old_counter = 0
    new_counter = 0
    errors = 0
    
    votes.each do |vote|
      
      if community = Community.find_by_id(vote.community_id)
        Time.zone = community.time_zone
      else
        Time.zone = "Pacific Time (US & Canada)"
      end
      if previous_vote = Vote.find(:last, :conditions => ["community_id = ? and ip_address = ? and created_at < ?",
                             vote.community_id, vote.ip_address, vote.created_at.in_time_zone.beginning_of_day], :order => "id")
        vote.days = (vote.created_at.in_time_zone.to_date - previous_vote.created_at.in_time_zone.to_date).to_f
        vote.save
      else
        vote.days = 0
        vote.save
      end
      
      if Ip.find_by_ip_address(vote.ip_address)
        old_counter += 1
        puts vote.ip_address + " already in"
      else
        new_counter +=1
        puts vote.ip_address + " not in"
        array = vote.ip_address.split('.')
        ipnum = 16777216*array[0].to_i + 65536*array[1].to_i + 256*array[2].to_i + array[3].to_i
        if geo_ip = GeoIp.find(:first, :conditions => ["start_ip <= ? and end_ip >= ?", ipnum, ipnum])
          if location = GeoIpLocation.find_by_id(geo_ip.geo_ip_location_id)
            Ip.create!({:ip_address => vote.ip_address, :integer_ip => ipnum,
                        :geo_ip_location_id => location.id, :country => location.country,
                        :region => location.region, :city => location.city, :postal_code => location.postal_code,
                        :latitude => location.latitude, :longitude => location.longitude,
                        :metro_code => location.metro_code, :area_code => location.area_code})
          else
            errors +=1
            puts "No location found."
          end
        else
          errors +=1
          puts "No geo_ip found."
        end
      end
      
    end
    Time.zone = "Pacific Time (US & Canada)"
    puts old_counter.to_s + " with existing ip addresses"
    puts new_counter.to_s + " with new ip addresses"
    puts errors.to_s + " errors where we couldn't find matching data"
    puts 'Task utils:process_votes done [%0.7s seconds]'.%([Time.now - start_time])
    puts '====================================='
  end
  
  
  desc "Tally and update rankings for communities that need it"
  task(:tally_update => :environment) do
    
    start_time = Time.now
    puts  'Task utils:tally_update started [%s]'.%([start_time])
    
    # Designed to be run once an hour: daily tally update for communities that need it --
    # usually those in the time zone that just passed midnight.
    # If the server was down for a while, this will catch up one day every hour.
    # For back-filling, run this once per day of back-fill needed:
   1.times {
    
    puts Time.now.to_s + " Finding communities that need tallying."
    communities = Community.find(:all, :order => "tallied_at, id")
    communities.each do |community|
        
      # puts "=============================== "  + community.id.to_s + ": " + community.name + " =========================="
      # puts Time.now.to_s + " Time to tally?"
      # Check to see if it's time to tally this community:
      Time.zone = community.time_zone
      # puts "Time zone: " + Time.zone.to_s
      # puts "Last tally cutoff: " + community.tallied_at.in_time_zone.to_s
      tally_cutoff = 36.hours.from_now(community.tallied_at).in_time_zone.beginning_of_day
      # puts "Next tally cutoff: " + tally_cutoff.to_s
      if 23.hours.from_now(community.tallied_at) > tally_cutoff
        puts "Warning: Tally interval looks too short for " + community.short_name
      end
      if 25.hours.from_now(community.tallied_at) < tally_cutoff
        puts "Warning: Tally interval looks too long for " + community.short_name
      end
      
      if tally_cutoff > Time.now
        # puts "Too soon to tally, so skipping this community."
      else
        # puts "OK, time to tally."
        print community.id.to_s + "   " + community.short_name + ": "
        
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
            puts "Warning: Funding id " + funding.id.to_s + " was already " + funding.allocated.to_s + "% allocated. Resetting to 0%."
            funding.allocated = 0
            funding.save
          end
        end
        
        # Get rankings for this community as of datetime tally_cutoff:
        rankings = Ranking.find(:all, :conditions => ["community_id = ? and created_at < ? and dropped_at > ?",
                                                     community.id,      tally_cutoff,      tally_cutoff], :order => "website_id")
        
        if rankings.any?
          
          # print rankings.size.to_s + " rankings. "
          
          community.tally(tally_cutoff, rankings)
          community.tallied_at = tally_cutoff
          community.save
          
          # Prepare to archive the newly tallied rankings; first, find them: [Or should this be returned from community.tally?]
          rankings = Ranking.find(:all, :conditions => ["community_id = ? and created_at < ? and dropped_at > ?",
                                                     community.id,      tally_cutoff,      tally_cutoff], :order => "website_id")
          rankings.each do |ranking|
            ranking.archive(tally_cutoff_date, fundings)
          end
          
          puts "Current rankings tallied. Calculate & store periodic past rankings."
          community.calc_periodic_rankings(tally_cutoff_date)
          # [Should we skip this calc when back-filling for many days? Using a counting loop within main routine?
          #  But if multi-period then it gets trickier...]
          
        else
          puts "0 rankings."
          community.tallied_at = tally_cutoff # This field is updated even if there were no rankings.
          community.save
          # puts "But there are no rankings to tally. Nonetheless, we deleted any leftover past_rankings for this date & "
          # puts "community, set any funding allocations to 0%, and moved the tallied_at date forward."
        end
        
      end
      Time.zone = "Pacific Time (US & Canada)"
    end
    puts  'Task utils:tally_update done [%0.7s seconds]'.%([Time.now - start_time])
    # puts "=============================== TALLY UPDATE COMPLETED =========================="
    puts "================================================================================="
   }
  end
  
  
  desc "Delete session records that are more than 30 days old"
  task(:delete_old_sessions => :environment) do
    sessions = Session.find(:all, :conditions => ["updated_at < ?", 1.month.ago])
    sessions.each do |session|
      session.delete
    end
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
  
  
end