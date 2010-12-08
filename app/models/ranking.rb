class Ranking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
  # Store this ranking record in past_rankings table:
  def archive(tally_cutoff_date, fundings)
    
    pr = PastRanking.create!({:ranking_id => self.id, :community_id => self.community_id, :website_id => self.website_id,
                              :rank => self.rank, :tallied_at => self.tallied_at, :share => self.share,
                              :status => self.status, :count0 => self.count0, :count1 => self.count1, :period => "day",
                              :start => tally_cutoff_date, :latest => tally_cutoff_date, :end => tally_cutoff_date})
    
    fundings.each do |funding|
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
