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
    @rankings = Ranking.find(:all)
    @rankings.each do |ranking|
      ranking.archive
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
  
end