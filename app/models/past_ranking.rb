class PastRanking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
  # Store this ranking record in past_rankings table:
  def allocate(fundings)
    self.funds = 0
    self.award = 0
    fundings.each do |funding|
      if funding.allocated + self.share <= 100.0
        funding.allocated += self.share
        self.funds += funding.amount
        self.award += funding.amount * self.share / 100.0
        funding.save
      else
        puts "Tried to allocate over 100% of funding ID " + funding.id.to_s
      end
    end
    self.save
  end
  
end
