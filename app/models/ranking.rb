class Ranking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
  # "rerank" is called from the communities controller. It recalculates the "rank" field in one record of the Ranking table.
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
      
      if lv[1].advance(:days => days_full_value) > Time.now
        new_rank += 1
      elsif lv[1].advance(:days => days_valid) > Time.now
        new_rank += (days_valid - (lv[1].advance(:days => days_valid).day - Time.now.day)) / ranking_formula_denominator 
      end 
    end
    
    self.rank = new_rank
    self.save!
    
  end
end
