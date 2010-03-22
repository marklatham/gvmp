class PastRanking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
  # Update periodic past_rankings that should include this daily past_ranking:
  
  def updatepr
    
    if month_ranking = PastRanking.find(:first, :conditions => ["period = ? and ranking_id = ? and start >= ? and start <= ?",
                          "month", self.ranking_id, self.start.beginning_of_month, self.start.end_of_month], :order => "id")
      if month_ranking.end < self.end
        month_ranking.ranking_updated_at = self.ranking_updated_at
        # First estimate of average share: simple average wieghted by number of days:
        month_ranking.share += (self.share - month_ranking.share)/(month_ranking.end - month_ranking.start + 2)
        month_ranking.count0 = self.count0
        month_ranking.count1 = self.count1
        month_ranking.funds += self.funds
        month_ranking.award += self.award
        month_ranking.status = self.status
        month_ranking.end = self.end
        month_ranking.save
      else
        puts "Month ranking date for id " + month_ranking.id.to_s + " already >= day ranking date for id " + self.id.to_s
      end
      
    else month_ranking = PastRanking.create!({:ranking_id => self.ranking_id, :community_id => self.community_id,
                              :website_id => self.website_id, :rank => self.rank,
                              :ranking_updated_at => self.ranking_updated_at, :share => self.share,
                              :count0 => self.count0, :count1 => self.count1,
                              :funds => self.funds, :award => self.award, :status => self.status,
                              :period => "month", :start => self.start, :end => self.end})
    end
    
  end

end
