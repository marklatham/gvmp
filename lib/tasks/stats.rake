namespace :stats do
  
  #  Statistical reports
  
  desc "For specified community & start & finish datetimes, calculate voting statistics"
  task(:voting => :environment) do
    
    c_id = 82
    community = Community.find(c_id)
    Time.zone = community.time_zone
    start = Time.parse("2010-01-01 0:00:00")
    finish = Time.parse("2010-12-23 0:00:00")
    
    puts "===================================================="
    puts "Voting statistics for " + community.short_name
    puts "From: " + start.to_s
    puts "Until: " + finish.to_s
    
    votes = Vote.where("community_id = ? and created_at >= ? and created_at < ? and (place = ? or place IS NULL)",
                                     c_id,               start,             finish,         "")
    puts votes.size.to_s + " votes in " + community.short_name + " this period."
    
    votes_pos = votes.select{|vote| vote.support > 0}
    puts votes_pos.size.to_s + " positive votes in " + community.short_name + " this period."
    
    ips = votes_pos.map(&:ip_address).uniq.sort
    puts ips.size.to_s + " ips voted positive support this period."
    
    puts "Number of ips who voted positive support this period for each website:"
    w_ids = votes_pos.map(&:website_id).uniq.sort
    for w_id in w_ids
      w_ips = votes_pos.select{|vote| vote.website_id == w_id}.map(&:ip_address).uniq
      website = Website.find(w_id)
      puts w_ips.size.to_s + ", " + website.title
    end
    puts ""
    
    day_ips = []
    for vote in votes_pos
      day_ips << [vote.ip_address, vote.created_at.beginning_of_day]
    end
    puts day_ips.uniq.size.to_s + " day-ip's voted this period"
    
    puts "Number of day-ips with positive support this period for each website:"
    for w_id in w_ids
      day_ips = []
      for vote in votes_pos
        if vote.website_id == w_id
          day_ips << [vote.ip_address, vote.created_at.beginning_of_day]
        end
      end
      website = Website.find(w_id)
      puts day_ips.uniq.size.to_s + ", " + website.title
    end
    puts ""
    
  end
  
  
end