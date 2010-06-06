class PastRanking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
  
  # Update periodic past_rankings that should include this daily past_ranking:
  
  def updatepr
    
    # "self" is a daily past_ranking (normally today's) so its dates start = latest = end
    # Find all period rankings that need to be updated using this daily record:
    
    @period_rankings = PastRanking.find(:all, :conditions => ["period != ? and ranking_id = ? and latest < ? and end >= ?",
                          "day", self.ranking_id, self.start, self.start], :order => "period, id")
    
    if @period_rankings.size > 2
      puts "Warning: Found " + @period_rankings.size.to_s + " period rankings for past_ranking.id " + self.id.to_s
    end
    
    # Make sure the right number of monthlies exist:
    
    monthlies = PastRanking.count(:conditions => ["period = ? and ranking_id = ? and end = ?",
                          "month", self.ranking_id, self.start.end_of_month])
    
    if monthlies == 0
      if self.start.day == 1 # Normal case -- creating new monthly on the first day of month; no missing days:
        first_sharing_this_month = self.start
        pr_share = self.share
        pr_funds = self.funds
      else
        puts "New website?: daily pr.id " + self.id.to_s + " had no monthly"
        # Start date for this period average shares = first date of any positive shares in this community this period:
        first_sharing_this_month = PastRanking.minimum(:start, :conditions =>
                         ["community_id = ? and period = ? and share > ? and start >= ? and start <= ?",
                          self.community_id, "day", 0.0, self.start.beginning_of_month, self.start.end_of_month])
        # Need to look up funding for any missing days, so simply get all days' fundings:
        pr_funds = Funding.sum(:amount, :conditions => ["community_id = ? and date >= ? and date <= ?",
                                                 self.community_id, first_sharing_this_month, self.start])
        if pr_funds > 0 # When there is funding, period share is fund-weighted average; any missing days assume award = 0:
          pr_share = 100 * self.award / pr_funds
        elsif self.start - first_sharing_this_month + 1 > 0
          # When there's no funding, period share is equal-daily-weighted average; any missing days assume share = 0:
          pr_share = self.share / (self.start - first_sharing_this_month + 1)
        else
          puts "Error: self.start - first_sharing_this_month + 1 <= 0 fordaily pr.id " + self.id.to_s
        end
      end
      
      PastRanking.create!({:ranking_id => self.ranking_id, :community_id => self.community_id,
                           :website_id => self.website_id, :rank => self.rank,
                           :ranking_updated_at => self.ranking_updated_at, :share => pr_share,
                           :count0 => self.count0, :count1 => self.count1,
                           :funds => pr_funds, :award => self.award, :status => self.status,
      :period => "month", :start => first_sharing_this_month, :latest => self.start, :end => self.start.end_of_month})
    end
    
    if monthlies > 1
      puts "Warning: Found " + monthlies.to_s + " monthlies for daily pr.id " + self.id.to_s
    end
    
    # Make sure the right number of yearlies exist:
    
    yearlies = PastRanking.count(:conditions => ["period = ? and ranking_id = ? and end = ?",
                          "year", self.ranking_id, self.start.end_of_year])
    
    if yearlies == 0
      if self.start.day == 1 && self.start.month == 1
        # Normal case -- creating new yearly on the first day of year; no missing days:
        first_sharing_this_year = self.start
        pr_share = self.share
        pr_funds = self.funds
      else
        puts "New website?: daily pr.id " + self.id.to_s + " had no yearly"
        # Start date for this period average shares = first date of any positive shares in this community this period:
        first_sharing_this_year = PastRanking.minimum(:start, :conditions =>
                         ["community_id = ? and period = ? and share > ? and start >= ? and start <= ?",
                          self.community_id, "day", 0.0, self.start.beginning_of_year, self.start.end_of_year])
        # Need to look up funding for any missing days, so simply get all days' fundings:
        pr_funds = Funding.sum(:amount, :conditions => ["community_id = ? and date >= ? and date <= ?",
                                                 self.community_id, first_sharing_this_year, self.start])
        if pr_funds > 0 # When there is funding, period share is fund-weighted average; any missing days assume award = 0:
          pr_share = 100 * self.award / pr_funds
        elsif self.start - first_sharing_this_year + 1 > 0
          # When there's no funding, period share is equal-daily-weighted average; any missing days assume share = 0:
          pr_share = self.share / (self.start - first_sharing_this_year + 1)
        else
          puts "Error: self.start - first_sharing_this_year + 1 <= 0 fordaily pr.id " + self.id.to_s
        end
      end
      
      PastRanking.create!({:ranking_id => self.ranking_id, :community_id => self.community_id,
                           :website_id => self.website_id, :rank => self.rank,
                           :ranking_updated_at => self.ranking_updated_at, :share => pr_share,
                           :count0 => self.count0, :count1 => self.count1,
                           :funds => pr_funds, :award => self.award, :status => self.status,
      :period => "year", :start => first_sharing_this_year, :latest => self.start, :end => self.start.end_of_year})
    end
    
    if yearlies > 1
      puts "Warning: Found " + yearlies.to_s + " yearlies for daily pr.id " + self.id.to_s
    end
    
    # Main loop: fold this daily into each period containing it:
    
    @period_rankings.each do |pr|
      
      pr.ranking_updated_at = self.ranking_updated_at
      pr.count0 = self.count0
      pr.count1 = self.count1
      pr.status = self.status
      pr.award += self.award
      
      if self.start - pr.latest == 1  # No missing days: normal case for daily processing.
        pr.funds += self.funds
      else  # Missing days: Need to look up funding for them, so simply get all days' fundings:
        puts "Not next day: pr.id " + pr.id.to_s + " has latest = " + pr.latest.to_s + " but daily.start = " + self.start.to_s
        pr.funds = Funding.sum(:amount, :conditions =>
                                     ["community_id = ? and date >= ? and date <= ?", pr.community_id, pr.start, self.start])
      end
      
      if pr.funds > 0 # When there is funding, period share is fund-weighted average; any missing days assume award = 0:
        pr.share = 100 * pr.award / pr.funds
      else      # When there's no funding, period share is equal daily weighted average; any missing days assume share = 0:
        pr.share = ((pr.latest - pr.start + 1)*pr.share + self.share) / (self.start - pr.start + 1)
      end
      
      pr.latest = self.start
      pr.save
      # pr.rank will be updated by a separate routine -- need to find & sort all website shares in this community.
    end
    
  end

  # Update period past_ranking when there is no corresponding daily past_ranking:
  
  def update_dropout(date_to_process)
    
    puts "Updating dropout for pr.id " + self.id.to_s
    
    if date_to_process - self.latest > 1
      puts "Warning: Update lag more than 1 day! for pr.id " + self.id.to_s
    end
    
    self.funds = Funding.sum(:amount, :conditions => ["community_id = ? and date >= ? and date <= ?",
                                                       self.community_id, self.start, date_to_process])
      
    if self.funds > 0 # When there is funding, period share is fund-weighted average; any missing days assume award = 0:
      self.share = 100 * self.award / self.funds
    else      # When there's no funding, period share is equal daily weighted average; any missing days assume share = 0:
      self.share = (self.latest - self.start + 1)*self.share / (date_to_process - self.start + 1)
    end
      
    self.latest = date_to_process
    self.save
    
  end

end
