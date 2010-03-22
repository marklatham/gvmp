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
    
    # Fold each daily ranking into its monthly and yearly rankings:
    @pr = PastRanking.find(:all, :conditions => ["period = ? and start = ?", "day", Date.today], :order => "id")
    @pr.each do |pr|
      pr.updatepr
    end
    
    # Community-wide calculations of monthly and yearly ranks and shares:
    @communities = Community.find(:all)
    @communities.each do |community|
      community.calcpr
    end
    
  end
  
  desc "Create &/or update community-wide fields in periodic (non-daily) past_rankings"
  task(:update_comm => :environment) do
    
    @communities = Community.find(:all)
    @communities.each do |community|
      
      @monthly_rankings = PastRanking.find(:all, :conditions => ["community_id = ? and period = ? and start >= ? and start <= ?",
                            community.id, "month", Date.today.beginning_of_month, Date.today.end_of_month],
                            :order => "award DESC, count1 DESC")
    
      rank_sequence = 0
      max_funds = 0.0
      @monthly_rankings.each do |mr|
        rank_sequence += 1
        mr.rank = rank_sequence
        mr.save
        if mr.funds > max_funds
          max_funds = mr.funds
        end
      end
    
      total_awards = 0.0
      @monthly_rankings.each do |mr|
        mr.funds = max_funds
        if mr.funds > 0 # Better calculation for share if mr.funds > 0 :
          mr.share = 100.0 * mr.award / mr.funds
        end
        mr.save
        total_awards += mr.award
      end
    
      if (total_awards - max_funds).abs > 0.09
        puts "Community number " + community.id.to_s + " monthly awards total $" + total_awards.to_s +
                                                  " but fundings total $" + max_funds.to_s
      end
    
    end
    
  end
  
  desc "Test some code -- not used in system so OK to change"
  task(:test_code => :environment) do
    
    @rankings = Ranking.find(:all, :conditions => ["community_id = ? and (status != ? OR status IS NULL)", "82", "limbo"],
                             :order => "website_id")
    
    @rankings.each do |ranking|
      puts ranking.website_id
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
      pr.period = "day"
      pr.start = pr.created_at.to_date
      pr.end = pr.created_at.to_date
      pr.save
    end
  end
  
end