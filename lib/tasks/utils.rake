namespace :utils do

#  Most tasks below are in our cron jobs, which are grouped in files on RPG server directory /home/votermed/cron/ :
#  group1 runs hourly at hh:15 -- tasks utils:process_votes and utils:tally_updates
#  group2 runs hourly at hh:35 -- task feed:load (in update_feeds.rake)
#  group3 runs daily at 10:55 UTC = 3:55am Pacific -- tasks utils:delete_old_sessions, utils:count_websites, ts:in and ts:in:delta
  
  desc "For new votes, calculate vote.days; and make sure vote.ip_address has a record in Ips table."
  task(:process_votes => :environment) do
    
    start_time = Time.now
    puts  'Task utils:process_votes started [%s]'.%([start_time])
    
    votes = Vote.where("days IS NULL").order("id")
    puts votes.size.to_s + " new votes"
    
    old_counter = 0
    new_counter = 0
    errors = 0
    
    votes.each do |vote|
      
      if place = Place.where("? LIKE ip_string", vote.ip_address).first
        vote.place = place.name
        vote.place_created_at = place.created_at
      else
        vote.place = nil
        vote.place_created_at = nil
      end
      if community = Community.find_by_id(vote.community_id)
        Time.zone = community.time_zone
      else
        Time.zone = "Pacific Time (US & Canada)"
      end
      if previous_vote = Vote.where("community_id = ? and ip_address = ? and created_at < ?",
                             vote.community_id, vote.ip_address, vote.created_at.in_time_zone.beginning_of_day).order("id").last
        vote.days = (vote.created_at.in_time_zone.to_date - previous_vote.created_at.in_time_zone.to_date).to_f
      else
        vote.days = 0
      end
      vote.save
      
      if Ip.find_by_ip_address(vote.ip_address)
        old_counter += 1
        puts vote.ip_address + " already in"
      else
        new_counter +=1
        puts vote.ip_address + " not in"
        array = vote.ip_address.split('.')
        ipnum = 16777216*array[0].to_i + 65536*array[1].to_i + 256*array[2].to_i + array[3].to_i
        if geo_ip = GeoIp.where("start_ip <= ? and end_ip >= ?", ipnum, ipnum).first
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
    communities = Community.order("tallied_at, id")
    communities.each do |community|
        
      # Check to see if it's time to tally this community:
      Time.zone = community.time_zone
      tally_cutoff = 36.hours.from_now(community.tallied_at).in_time_zone.beginning_of_day
      if 23.hours.from_now(community.tallied_at) > tally_cutoff
        puts "Warning: Tally interval looks too short for " + community.short_name
      end
      if 25.hours.from_now(community.tallied_at) < tally_cutoff
        puts "Warning: Tally interval looks too long for " + community.short_name
      end
      
      unless tally_cutoff > Time.now
      
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
        fundings = Funding.where("community_id = ? and date = ?", community.id, tally_cutoff_date)
        fundings.each do |funding|
          if funding.allocated != 0
            puts "Warning: Funding id " + funding.id.to_s + " was already " +
                  funding.allocated.to_s + "% allocated. Resetting to 0%."
            funding.allocated = 0
            funding.save
          end
        end
        
        # Get rankings for this community as of datetime tally_cutoff:
        rankings = Ranking.where("community_id = ? and created_at < ? and dropped_at > ?",
                                               community.id,      tally_cutoff,      tally_cutoff).order("website_id")
        
        if rankings.any?
          
          # print rankings.size.to_s + " rankings. "
          
          community.tally(tally_cutoff, rankings)
          community.tallied_at = tally_cutoff
          community.save
          puts Time.now.to_s + " Tally completed."
          
          # Prepare to archive the newly tallied rankings; first, find them: [Or should this be returned from community.tally?]
          rankings = Ranking.where("community_id = ? and created_at < ? and dropped_at > ?",
                                               community.id,      tally_cutoff,      tally_cutoff).order("website_id")
          rankings.each do |ranking|
            ranking.archive(tally_cutoff_date, fundings)
          end
          
          puts Time.now.to_s + " Current rankings tallied. Calculate & store periodic past rankings."
          community.calc_periodic_rankings(tally_cutoff_date)
          
        else
          puts "0 rankings."
          community.tallied_at = tally_cutoff # This field is updated even if there were no rankings.
          community.save
        end
        
      end
      Time.zone = "Pacific Time (US & Canada)"
    end
    puts  'Task utils:tally_update done [%0.7s seconds]'.%([Time.now - start_time])
    puts "================================================================================="
   }
  end
  
  
  desc "Recalculate count0 & count1 for communities where administrator has back-dated community.tallied_at"
  # You may want to run utils:tally_update first, to make sure all other communities are up to date.
  task(:check_past => :environment) do
    # This repeats a lot of code from tally_past routine above. But here, just checking 2 vote counts per website.
    start_time = Time.now
    puts  'Task utils:check_past started [%s]'.%([start_time])
    
    # Run this once per day of recalc needed:
   1.times {
    
    puts Time.now.to_s + " Finding communities that need recalc."
    communities = Community.order("tallied_at, id")
    communities.each do |community|
      
      # puts "====== " + community.id.to_s + "   " + community.short_name + ": "
      
      # Not sure if this is necessary or if it's unhelpful:
      Time.zone = community.time_zone
      
      # Check to see if there are any subsequent past_rankings to recalc for this community.
      # This is written so as to handle both cutoff systems used pre- & post- 2010-04-01,
      # when we changed from about 3:15am Pacific time cutoff to the subsequent midnight cutoff in community's time zone:
      
      if next_ranking = PastRanking.where("community_id = ? and period = ? and tallied_at > ?",
                                           community.id, "day", 4.hours.from_now(community.tallied_at)).order("tallied_at").first
      
        tally_cutoff = next_ranking.tallied_at
        tally_cutoff_date = next_ranking.start
        puts "Tally cutoff = " + tally_cutoff.to_s + ". Tally cutoff date = " + tally_cutoff_date.to_s
        
        print community.id.to_s + "   " + community.short_name + ": "
        
        # Get past rankings for this community for tally_cutoff_date:
        past_rankings = PastRanking.where("community_id = ? and period = ? and start = ?",
                                                               community.id,     "day", tally_cutoff_date).order("website_id")
        
        if past_rankings.any?
          
          print past_rankings.size.to_s + " past rankings on date " + tally_cutoff_date.to_s + ". "
          
          community.check(tally_cutoff, past_rankings)
          community.tallied_at = tally_cutoff
          community.save
          
        else
          puts "Warning! No rankings found -- shouldn't be possible here."
        end
        
      end
      Time.zone = "Pacific Time (US & Canada)"
    end
    puts  'Task utils:check_past done [%0.7s seconds]'.%([Time.now - start_time])
    puts "================================================================================="
   }
  end
  
  
  desc "Recalculate past_rankings for communities where administrator has back-dated community.tallied_at"
  # You may want to run utils:tally_update first, to make sure all other communities are up to date.
  task(:tally_past => :environment) do
    
    start_time = Time.now
    puts  'Task utils:tally_past started [%s]'.%([start_time])
    
    # Run this once per day of recalc needed:
   1.times {
    
    puts Time.now.to_s + " Finding communities that need recalc."
    communities = Community.order("tallied_at, id")
    communities.each do |community|
      
      # puts "====== " + community.id.to_s + "   " + community.short_name + ": "
      
      # Not sure if this is necessary or if it's unhelpful:
      Time.zone = community.time_zone
      
      # Check to see if there are any subsequent past_rankings to recalc for this community.
      # This is written so as to handle both cutoff systems used pre- & post- 2010-04-01,
      # when we changed from about 3:15am Pacific time cutoff to the subsequent midnight cutoff in community's time zone:
      
      if next_ranking = PastRanking.where("community_id = ? and period = ? and tallied_at > ?",
                                           community.id, "day", 4.hours.from_now(community.tallied_at)).order("tallied_at").first
      
        tally_cutoff = next_ranking.tallied_at
        tally_cutoff_date = next_ranking.start
        puts "Tally cutoff = " + tally_cutoff.to_s + ". Tally cutoff date = " + tally_cutoff_date.to_s
        
        print community.id.to_s + "   " + community.short_name + ": "
        
        # Make sure any funding allocation totals are reset to 0:
        fundings = Funding.where("community_id = ? and date = ?", community.id, tally_cutoff_date)
        fundings.each do |funding|
          if funding.allocated != 0
            puts "Warning: Funding id " + funding.id.to_s + " was already " +
                  funding.allocated.to_s + "% allocated. Resetting to 0%."
            funding.allocated = 0
            funding.save
          end
        end
        
        # Get past rankings for this community for tally_cutoff_date:
        past_rankings = PastRanking.where("community_id = ? and period = ? and start = ?",
                                                      community.id,     "day", tally_cutoff_date).order("website_id")
        
        if past_rankings.any?
          
          print past_rankings.size.to_s + " past rankings on date " + tally_cutoff_date.to_s + ". "
          
          community.tally(tally_cutoff, past_rankings)
          community.tallied_at = tally_cutoff
          community.save
          
          past_rankings.each do |past_ranking|
            past_ranking.allocate(fundings)
          end
          
          puts "Tallied. Calculate & store periodic past rankings."
          community.calc_periodic_rankings(tally_cutoff_date)
          
        else
          puts "Warning! No rankings found -- shouldn't be possible here."
        end
        
      end
      Time.zone = "Pacific Time (US & Canada)"
    end
    puts  'Task utils:tally_past done [%0.7s seconds]'.%([Time.now - start_time])
    puts "================================================================================="
   }
  end
  
  # I guess this is not needed in our rails3 app because devise doesn't use sessions table, so sessions table obsolete?:
  desc "Delete session records that are more than 30 days old"
  task(:delete_old_sessions => :environment) do
    sessions = Session.where("updated_at < ?", 1.month.ago)
    sessions.each do |session|
      session.delete
    end
  end
  
  
  desc "Check n_websites for each community; update if needed:"
  task(:count_websites => :environment) do
    puts Time.now.to_s + " Checking n_websites for all communities."
    communities = Community.find(:all)
    communities.each do |community|
      check_n_websites = Ranking.where("community_id = ? and dropped_at > ?", community.id, Time.now).count
      unless community.n_websites == check_n_websites
        puts "Updating n_websites for " + community.name + " from " + community.n_websites.to_s +
             " to " + check_n_websites.to_s
        puts "Ranking ids:"
        rankings = Ranking.where("community_id = ? and dropped_at > ?", community.id, Time.now)
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