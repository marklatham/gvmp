namespace :utils do
  desc "Recalculate all website/blog rankings"
  task(:rerank_all => :environment) do
    @rankings = Ranking.find(:all)
	  @rankings.each do |ranking|
	    ranking.rerank
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
    @rankings = Ranking.find(:all)
	  @rankings.each do |ranking|
	    ranking.archive
	  end
  end
  
end