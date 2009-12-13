class Ranking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
  # Store this ranking record in past_rankings table:
  
  def archive
    
    pr = PastRanking.create!({:ranking_id => self.id, :community_id => self.community_id, :website_id => self.website_id,
                              :rank => self.rank, :ranking_updated_at => self.updated_at, :share => self.share,
                              :sequence => self.sequence, :count0 => self.count0, :count1 => self.count1})
    
  end

end
