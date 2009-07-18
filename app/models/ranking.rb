class Ranking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
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
