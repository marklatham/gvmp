class Ranking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
  # Store this ranking record in past_rankings table:
  
  def archive
    
    pr = PastRanking.create!({:ranking_id => self.id, :community_id => self.community_id, :website_id => self.website_id,
                              :rank => self.rank, :ranking_updated_at => self.updated_at, :share => self.share,
                              :count0 => self.count0, :count1 => self.count1})
    
    @fundings = Funding.find(:all, :conditions => ["date = ? AND allocated < ?", Date.today, 100])
    if @fundings
      @fundings.each do |funding|
        if funding.community_id == pr.community_id
          funding.allocated += pr.share
          pr.funds += funding.amount
          pr.award += funding.amount * pr.share / 100.0
          funding.save
          pr.save
        end
      end
    end
    
  end

end
