class Ranking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
  # Store this ranking record in past_rankings table:
  
  def archive
    
    pr = PastRanking.create!({:ranking_id => self.id, :community_id => self.community_id, :website_id => self.website_id,
                              :rank => self.rank, :ranking_updated_at => self.updated_at, :share => self.share,
                              :sequence => self.sequence, :count0 => self.count0, :count1 => self.count1})
    
  end
  
  # The ranking.rank field has not been used since about August 2009 when the tally algorithm was fully implemented.
  # So this routine "rerank" can be deleted, along with the cron job and util that call it.
  # "rerank" is called from the admin controller. It recalculates the "rank" field in one record of the Ranking table.
  # "rank" is actually a vote tally -- the sum of votes for that website in that community, subject to these conditions:
  # Only the latest vote from each ip address is counted.
  # Votes decay through time, counting 1.00 for "days_full_value" days, then linear decay down to 0.00 after "days_valid" days.
  
  def rerank
    
    #constants
    days_full_value = 10
    days_valid = 60
    ranking_formula_denominator = 50
    
    latest_vote = Vote.maximum(:updated_at, 
                               :conditions => ["community_id = ? and website_id = ?", self.community_id, self.website_id],                     
                               :group => "ip_address")
   
    new_rank = 0          
                    
    latest_vote.each do |lv|

	    days_old = (Time.now.to_date - lv[1].to_date).to_i
    
      if days_old < days_full_value
        new_rank += 1
      elsif days_old < days_valid
        new_rank += (days_valid - days_old) / ranking_formula_denominator.to_f
      end

    end
    
    self.rank = new_rank
    self.save!
    
  end
end
