namespace :utils do
  desc "Recalculate all website/blog rankings"
  task(:rerank_all => :environment) do
    @rankings = Ranking.find(:all)
	  @rankings.each do |ranking|
	    ranking.rerank
	  end
  end
end