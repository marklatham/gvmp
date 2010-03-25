class Ranking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
  # Store this ranking record in past_rankings table:
  
  def archive
    
    pr = PastRanking.create!({:ranking_id => self.id, :community_id => self.community_id, :website_id => self.website_id,
                              :rank => self.rank, :ranking_updated_at => self.updated_at, :share => self.share,
                              :status => self.status, :count0 => self.count0, :count1 => self.count1,
                              :period => "day", :start => Date.today, :latest => Date.today, :end => Date.today})
    
    if @fundings = Funding.find(:all, :conditions => ["date = ? AND community_id = ?", Date.today, pr.community_id])
      @fundings.each do |funding|
        
        if funding.allocated + pr.share <= 100.0
          funding.allocated += pr.share
          pr.funds += funding.amount
          pr.award += funding.amount * pr.share / 100.0
          funding.save
          pr.save
        else
          puts "Tried to allocate over 100% of funding ID " + funding.id.to_s
        end
        
      end
    end
    
  end

end
