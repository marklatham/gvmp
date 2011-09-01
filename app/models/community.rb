class Community < ActiveRecord::Base
  # TODO: protect attributes from mass-assignment
  # counter-cache for number of websites
  
  has_many :rankings do
    def with_websites
      map{|ranking| { :rank => ranking.rank, :created_at => ranking.created_at,
                      :website => ranking.website, :share => ranking.share, :status => ranking.status,
                      :count0 => ranking.count0, :count1 => ranking.count1, :ranking_id => ranking.id }}.sort_by {
                      |website_and_ranking| [website_and_ranking[:rank]] }
    end
  end
  has_many :websites, :through => :rankings
  has_many :fundings
  has_many :feedbacks

  validates_presence_of :name, :short_name, :idstring
  validates_presence_of :category, :message => "(Type) can't be blank"
  validates_length_of :name, :maximum => 50
  validates_length_of :short_name, :maximum => 20, :message => ": please shorten to 20 characters or less"
  validates_length_of :category, :maximum => 20
  validates_length_of :country, :maximum => 30
  validates_length_of :prov_state, :maximum => 30
  validates_length_of :city, :maximum => 30
  validates_uniqueness_of :idstring, :case_sensitive => false, :message => "Sorry, that idstring is already in use."

  scope :recently_created, order('communities.created_at DESC')
  scope :recently_updated, order('communities.updated_at DESC')


  # Required by sphinx
#  define_index do
#    indexes name, short_name, category, country, prov_state, city, scope, :sortable => true
#    has n_websites, :sortable => true
#    set_property :delta => true
#  end

  cattr_reader :per_page
  @@per_page = 30

  def to_param
    short_name.blank? ? id : "#{id}-#{short_name.parameterize}"
  end

  def location
    "#{city} #{prov_state} #{country}"
  end
  
  def tally(tally_cutoff, rankings)
    
    # Get parameters for this community as of tally_cutoff
    parameter = Parameter.where("as_of <= ? and community_id = ?", tally_cutoff, self.id).order("as_of").last
    unless parameter
      parameter = Parameter.where("as_of <= ? and community_id = 0", tally_cutoff).order("as_of").last
    end
    puts "Parameters as of " + parameter.as_of.to_s + " for community_id = " + parameter.community_id.to_s
    
    votes_login = Vote.where("community_id = ? and created_at > ? and created_at < ? and
                              (user_id IS NOT NULL and (fb_login <> 0 or email_membership <> 0)) and
                              (place_created_at > ? or place_created_at IS NULL)",
                      self.id, parameter.start_voting, tally_cutoff, tally_cutoff).order("user_id, website_id, created_at DESC")
    # Note that if the login is via non-community email not facebook, then vote is grouped with nonlogin here:
    votes_email = Vote.where("community_id = ? and created_at > ? and created_at < ? and 
                              (user_id IS NOT NULL and (fb_login = 0 and email_membership = 0)) and
                              (place_created_at > ? or place_created_at IS NULL)",
                      self.id, parameter.start_voting, tally_cutoff, tally_cutoff).order("user_id, website_id, created_at DESC")
    votes_nologin = Vote.where("community_id = ? and created_at > ? and created_at < ? and
                               user_id IS NULL and
                              (place_created_at > ? or place_created_at IS NULL)",
                      self.id, parameter.start_voting, tally_cutoff, tally_cutoff).order("ip_address, website_id, created_at DESC")
    puts "Number of logged in votes found = " + votes_login.size.to_s
    puts "Number of email votes found = " + votes_email.size.to_s
    puts "Number of non logged in votes found = " + votes_nologin.size.to_s
    
    # Only count the latest logged in vote from each user_id on each website:
    # For each [user_id or ip_address, website_id], votes are in reverse chronological order, so keep the first one in each group.
    
    votes_login_to_count = []
    if votes_login.any?
      keep_vote = votes_login[0]
      votes_login_to_count << keep_vote
      votes_login.each do |vote_login|
        unless vote_login.user_id == keep_vote.user_id && vote_login.website_id == keep_vote.website_id
          keep_vote = vote_login
          votes_login_to_count << keep_vote
        end
      end
    end
    puts "Number of logged in votes left = " + votes_login_to_count.size.to_s
    
    votes_email_to_count = []
    if votes_email.any?
      keep_vote = votes_email[0]
      votes_email_to_count << keep_vote
      votes_email.each do |vote_email|
#        puts vote_email.id.to_s + " " + vote_email.ip_address + " " + vote_email.website_id.to_s + " " + vote_email.user_id.to_s
        unless vote_email.user_id == keep_vote.user_id && vote_email.website_id == keep_vote.website_id
          keep_vote = vote_email
          votes_email_to_count << keep_vote
        end
      end
    end
    puts "Number of email votes left = " + votes_email_to_count.size.to_s
    
    # Note that if the login is via non-community email not facebook, then vote is grouped with nonlogin here:
    votes_nologin = votes_nologin.concat(votes_email_to_count)
    votes_nologin.sort! do |a,b|
      [b.ip_address, b.website_id, b.created_at] <=> [a.ip_address, a.website_id, a.created_at]
    end
    
    # Find the latest non logged in vote from ip_address on each website:
    votes_nologin_to_count = []
    if votes_nologin.any?
      keep_vote = votes_nologin[0]
      votes_nologin_to_count << keep_vote
      votes_nologin.each do |vote_nologin|
        unless vote_nologin.ip_address == keep_vote.ip_address && vote_nologin.website_id == keep_vote.website_id
          keep_vote = vote_nologin
          votes_nologin_to_count << keep_vote
        end
      end
    end
    
    puts "Number of non logged in votes left = " + votes_nologin_to_count.size.to_s
    
    # Drop non-logged-in votes from IPs with logged-in votes being counted in days_valid period:
    ips_with_login_votes = []
    votes_login_to_count.each do |vote_login|
      days_old = (tally_cutoff.to_date - vote_login.created_at.to_date).to_i
      if days_old < parameter.days_valid
        ips_with_login_votes << vote_login.ip_address
      end
    end
    ips_with_login_votes = ips_with_login_votes.uniq.sort
    votes = votes_login_to_count
    votes_nologin_to_count.each do |vote_nologin|
      unless ips_with_login_votes.include?(vote_nologin.ip_address)
        votes << vote_nologin
      end
    end
    
    puts "Number of votes to count = " + votes.size.to_s
    
    votes.each do |vote|
      if vote.created_at > 2.months.ago(tally_cutoff)
        if vote.user_id
          puts vote.id.to_s + " " + vote.ip_address + " " + vote.website_id.to_s + " " + vote.user_id.to_s
        else
          puts vote.id.to_s + " " + vote.ip_address + " " + vote.website_id.to_s
        end
      end
    end
    
    unless self.tallied_at == rankings[0].tallied_at
      puts "Warning: Rankings last tallied at " + rankings[0].tallied_at.to_s + " not same as when community last tallied: " + self.tallied_at.to_s
    end
    
    if rankings.any?
      print rankings.size.to_s + " rankings. "
    else
      print "Warning: Found no rankings! "
    end
    
    # Make sure shares are nonnegative whole numbers, not all zero:
    rankings.each do |ranking|
      ranking.share = ranking.share.round
      if ranking.share < 0.0
        ranking.share = 0.0
      end
    end
    if rankings.sum(:share) <= 0.0
      rankings.each do |ranking|
        ranking.share = 1.0
      end
    end

    # Calculate count0 (# votes for share or more) and count1 (# votes for share+1 or more) for each ranking:
    rankings.each do |ranking|
      ranking.count0 = countVotes(tally_cutoff, votes, ranking, 0.0, parameter)
      ranking.count1 = countVotes(tally_cutoff, votes, ranking, 1.0, parameter)
    end
    
    # Need to adjust shares until they sum to 100.0 and max_count1 <= min_count0(for websites with positive shares).
    # max_count1 is the ranking record for the website that most deserves to have its share increased.
    # min_count0 is the ranking record for the website that most deserves to have its share decreased.
    
    max_count1 = rankings.max {|a,b| a.count1 <=> b.count1 }
    # Can only reduce a share if it's positive, so:
    rankings_pos = rankings.find_all {|r| r.share > 0.0 }
    min_count0 = rankings_pos.min {|a,b| a.count0 <=> b.count0 }
    # but if all shares = 0.0, min_count0 is nil which gives error; hence prevented above.
    
    # If shares sum to more than 100 (which shouldn't happen, but just in case), decrease 1 at a time:
    while rankings.sum(:share) > 100.0
      min_count0.share -= 1.0
      min_count0.save
      min_count0.count1 = min_count0.count0
      min_count0.count0 = countVotes(tally_cutoff, votes, min_count0, 0.0, parameter)
      
      rankings_pos = rankings.find_all {|r| r.share > 0.0 }
      min_count0 = rankings_pos.min {|a,b| a.count0 <=> b.count0 }
      max_count1 = rankings.max {|a,b| a.count1 <=> b.count1 }
    end
    
    # If shares sum to less than 100 (e.g. when first website[s] added), increase 1 at a time:
    while rankings.sum(:share) < 100.0
      max_count1.share += 1.0
      max_count1.save
      max_count1.count0 = max_count1.count1
      max_count1.count1 = countVotes(tally_cutoff, votes, max_count1, 1.0, parameter)
      
      rankings_pos = rankings.find_all {|r| r.share > 0.0 }
      min_count0 = rankings_pos.min {|a,b| a.count0 <=> b.count0 }
      max_count1 = rankings.max {|a,b| a.count1 <=> b.count1 }
    end
    
    # Main loop: Adjust shares until max_count1 <= min_count0 i.e. find a cutoff number of votes (actually a range of cutoffs)
    # where shares sum to 100.0 using that same cutoff to determine each website's share.
    # This is like a stock market order matching system. Each count1 is a bid; each count0 is an offer.
    # If the highest bid is higher than the lowest offer, then a trade of 1% happens.
    # It's a competitive market for public goods:
    
    while min_count0.count0 < max_count1.count1
      # Move one percent share from min_count0 to max_count1:
      
      min_count0.share -= 1.0
      min_count0.count1 = min_count0.count0
      min_count0.count0 = countVotes(tally_cutoff, votes, min_count0, 0.0, parameter)
      
      max_count1.share += 1.0
      max_count1.count0 = max_count1.count1
      max_count1.count1 = countVotes(tally_cutoff, votes, max_count1, 1.0, parameter)
      
      rankings_pos = rankings.find_all {|r| r.share > 0.0 }
      min_count0 = rankings_pos.min {|a,b| a.count0 <=> b.count0 }
      max_count1 = rankings.max {|a,b| a.count1 <=> b.count1 }
      
    end
    
    # Share calculations are now completed, so sort & store rankings for this community:
    rankings.sort! do |a,b|
      [b.share, b.count1, b.created_at] <=> [a.share, a.count1, a.created_at]
    end
    rank_sequence = 0
    rankings.each do |ranking|
      rank_sequence += 1
      ranking.rank = rank_sequence
      ranking.tallied_at = tally_cutoff
      ranking.save
    end
    
  end
  
  def check(tally_cutoff, rankings)
    # NEED TO UPDATE THIS REPEATED CODE BEFORE USING IT AGAIN!
    # This repeats a lot of code from tally routine above. But here, just checking 2 vote counts per website.
    # Get parameters for this community as of tally_cutoff
    parameter = Parameter.where("as_of <= ? and community_id = ?", tally_cutoff, self.id).order("as_of").last
    unless parameter
      parameter = Parameter.where("as_of <= ? and community_id = 0", tally_cutoff).order("as_of").last
    end
    puts "Parameters as of " + parameter.as_of.to_s + " for community_id = " + parameter.community_id.to_s
    
    # How to select the latest vote from each IP address for each website?:
    # This doesn't get all data fields, so no good I guess:
    #    votes = Vote.maximum(:updated_at, 
    #                               :conditions => ["community_id = ?", self.id],                     
    #                               :group => "ip_address, website_id")    
    
    # This almost works, but returns the first record of each group (by ID, regardless of how sorted)
    # while we want the latest record:
    # votes = Vote.find(:all, :conditions => ["community_id = ? and created_at < ? and (place = ? or place IS NULL)",
    #                                                    self.id,      tally_cutoff,            ""],
    #                    :order => "website_id, ip_address, created_at DESC", :group => "website_id, ip_address")    
    
    # So find votes sorted:
    votes=Vote.where("community_id = ? and created_at > ? and created_at < ? and (place_created_at > ? or place_created_at IS NULL)",
                        self.id, parameter.start_voting, tally_cutoff, tally_cutoff).order("ip_address, website_id, created_at DESC")
    
    # Only count the latest vote from each ip_address on each website.
    # For each [ip_address, website_id], votes are in reverse chronological order, so keep the first one in each group:
    puts Time.now.to_s + " Number of votes found = " + votes.size.to_s
    if votes.any?
      keep_vote = votes[0]
      votes_to_count = []
      votes_to_count << keep_vote
      votes.each do |vote|
        unless vote.ip_address == keep_vote.ip_address && vote.website_id == keep_vote.website_id
          keep_vote = vote
          votes_to_count << keep_vote
        end
      end
      votes = votes_to_count
    end
    puts Time.now.to_s + " Number of votes left = " + votes.size.to_s
    
    unless self.tallied_at == rankings[0].tallied_at
      puts "Warning: Rankings last tallied at " + rankings[0].tallied_at.to_s + " not same as when community last tallied!"
    end
    
    if rankings.any?
      puts rankings.size.to_s + " rankings. "
    else
      puts "Warning: Found no rankings! "
    end
    
    # Calculate count0 (# votes for share or more) and count1 (# votes for share+1 or more) for each ranking:
    rankings.each do |ranking|
      check_count0 = countVotes(tally_cutoff, votes, ranking, 0.0, parameter)
      check_count1 = countVotes(tally_cutoff, votes, ranking, 1.0, parameter)
      unless ((ranking.count0-check_count0)*1000).round == 0 && ((ranking.count1-check_count1)*1000).round == 0
        puts ranking.end.strftime("%Y-%m-%d") + ", " + self.id.to_s + ", " + ranking.website_id.to_s + ", " + ranking.share.to_s +
        ", " + ranking.count0.to_s + ", " + check_count0.to_s + ", " + (ranking.count0-check_count0).to_s +
        ", " + ranking.count1.to_s + ", " + check_count1.to_s + ", " + (ranking.count1-check_count1).to_s
      end
    end
    
  end
  
  # Subroutine to count the number of (time-decayed) votes for shares >= cutoff = ranking.share + increment
  def countVotes(tally_cutoff, votes, ranking, increment, parameter)
    cutoff = ranking.share + increment
#    puts "Counting votes for website id " + ranking.website_id.to_s +
#         " at cutoff = " + cutoff.to_s if ranking.community_id == 82
    
#    if ranking.website_id == 232 || ranking.website_id == 225 || ranking.website_id == 239 || ranking.website_id == 269
#      puts "========================================="
#      puts "Website_id: " + ranking.website_id.to_s
#      puts tally_cutoff
#      puts ranking.share
#      puts increment
#    end
    
    count = parameter.spread_previous * (100.0 - ranking.share) # To break ties caused by having no votes. This will equalize shares.
    votes.each do |vote|
      if vote.website_id == ranking.website_id && vote.support
        
        # Time decay of vote:
        days_old = (tally_cutoff.to_date - vote.created_at.to_date).to_i
        if days_old < parameter.days_full_value
          decayed_weight = 1.0
        elsif days_old < parameter.days_valid
          decayed_weight = (parameter.days_valid - days_old) / parameter.ranking_formula_denominator.to_f
        else
          decayed_weight = parameter.old_votes_weight / days_old  # To break ties caused by having no votes during days_valid.
        end
        
        if vote.ballot_type == 2
          # ballot_type 2 is Interpolated Consensus:
          if vote.support < 0.1
            # This is to catch the special case of vote.support = 0.0 -- no interpolation.
            if cutoff < 0.1
              support_fraction = 1.0
              # In case it's useful to see how many voted for 0.0
            else
              support_fraction = 0.0
            end
          elsif vote.support - 0.5*parameter.interpolation_range > cutoff
            support_fraction = 1.0
          elsif vote.support + 0.5*parameter.interpolation_range < cutoff
            support_fraction = 0.0
          else
            support_fraction = 0.5 + ( (vote.support - cutoff) / parameter.interpolation_range )
          end
          
        elsif vote.ballot_type == 101 # Changed from == 1 to in effect comment this out.
          # ballot_type 1 is simple percent vote for vote.support:
          if vote.support >= cutoff
            support_fraction = 1.0
          else
            support_fraction = 0.0
          end
          
        elsif vote.ballot_type == 100 # Changed from == 0 to in effect comment this out.
          # Ballot_type 0 means voted for "Increase Share" from vote.support = share when voted,
          # interpreted as uniform distribution of vote from vote.support to 100.0:
          if vote.support >= cutoff
            support_fraction = 1.0
          elsif vote.support >= 100.0 or cutoff > 100.0
            support_fraction = 0.0
          else
            support_fraction = (100.0 - cutoff)/(100.0 - vote.support)
          end
          
        else
          # No provision for other ballot types at this point:
          support_fraction = 0.0
          
        end
        
        # Weight vote according to login info re that community:
        login_factor = parameter.no_login_weight
        login_factor = parameter.email_membership_weight if vote.email_membership?
#        puts login_factor if vote.created_at > 2.months.ago(tally_cutoff)
        if vote.fb_membership?
          login_factor = parameter.fb_membership_weight if parameter.fb_membership_weight > login_factor
        elsif vote.fb_login?
          login_factor = parameter.fb_login_weight if parameter.fb_login_weight > login_factor
        elsif vote.user_id
          login_factor = parameter.email_only_weight if parameter.email_only_weight > login_factor
#          puts (login_factor + 10) if vote.created_at > 2.months.ago(tally_cutoff)
        end
        puts "vote.id = " + vote.id.to_s + "; decayed_weight = " + decayed_weight.to_s + 
        "; support = " + vote.support.to_s + "; support_fraction = " + support_fraction.to_s + "; login factor = " +
        login_factor.to_s if vote.created_at > 2.months.ago(tally_cutoff) && ranking.community_id == 96
        count += decayed_weight * support_fraction * login_factor
        
#        if ranking.website_id == 232 || ranking.website_id == 225 || ranking.website_id == 239 || ranking.website_id == 269
#          print vote.id
#          print ", "
#          print decayed_weight
#          print ", "
#          puts support_fraction
#        end
        
      end
    end
    # This is mainly to give parameter.spread something to work with in the rare case where there are no votes.
    # For that purpose, something tiny like parameter.bonus_votes = 0.01 would be sufficient.
    # If we do this, then it could take the place of parameter.spread_previous.
    count += parameter.bonus_votes
    
    # This is designed to encourage competition by handicapping larger shares. spread = 1.0 means no handicap:
    spread_count = count / ( parameter.spread**(cutoff*0.01) )
    return spread_count
  end
  
  # Calculate periodic (non-daily) past_rankings for this community and date:
  def calc_periodic_rankings(tally_cutoff_date)
    
    if self.id == 82
      puts "======= UBC calc_periodic_rankings diagnostics: ========"
    end
    PastRanking.delete_all(["community_id = ? and period != ? and start <= ? and end >= ?",
                                    self.id,       "day", tally_cutoff_date, tally_cutoff_date])
    
    for period in ["month", "year"]
      
      if period == "month"
        beginning_of_period = tally_cutoff_date.beginning_of_month
        end_of_period = tally_cutoff_date.end_of_month
      else
        beginning_of_period = tally_cutoff_date.beginning_of_year
        end_of_period = tally_cutoff_date.end_of_year
      end
      
      first_ranked_date = PastRanking.where("community_id = ? and period = ? and start >= ? and start <= ?",
                                                          self.id, "day", beginning_of_period, end_of_period).minimum(:start)
      last_ranked_date = PastRanking.where("community_id = ? and period = ? and start >= ? and start <= ?",
                                                          self.id, "day", beginning_of_period, end_of_period).maximum(:start)
      
      funds = Funding.where("community_id = ? and date >= ? and date <= ?",
                                        self.id, first_ranked_date, last_ranked_date).sum(:amount)
      
      n_days = PastRanking.where("community_id = ? and period = ? and start >= ? and start <= ?",
                                              self.id, "day", first_ranked_date, last_ranked_date).count(:start, :distinct => true)
      if n_days != 1 + (last_ranked_date - first_ranked_date)
        puts "Warning: n_days = " + n_days.to_s + " but we seem to have " +
         (1 + (last_ranked_date - first_ranked_date) - n_days).to_s + " missing days in this " + period + "."
      end
      
      # Find the ranking_ids that have any past_rankings on the days we are considering:
      if funds > 0
        past_rankings = PastRanking.where("community_id = ? and period = ? and start >= ? and start <= ? and funds > 0",
                        self.id, "day", first_ranked_date, last_ranked_date).group("ranking_id").order("ranking_id, start")
      else
        past_rankings = PastRanking.where("community_id = ? and period = ? and start >= ? and start <= ?",
                        self.id, "day", first_ranked_date, last_ranked_date).group("ranking_id").order("ranking_id, start")
      end
      
      past_rankings.each do |past_ranking|
        
        if funds > 0
          award = PastRanking.where("community_id = ? and ranking_id = ? and period = ? and start >= ? and start <= ?",
                                       self.id, past_ranking.ranking_id, "day", first_ranked_date, last_ranked_date).sum(:award)
          share = award * 100 / funds
          if self.id == 82
            puts past_ranking.id.to_s + ", " + past_ranking.website_id.to_s + ", " + share.to_s + 
                ", " + award.to_s + ", " + funds.to_s + ", FUNDED"
          end
        else
          award = 0
          share = PastRanking.where("community_id = ? and ranking_id = ? and period = ? and start >= ? and start <= ?",
                                    self.id, past_ranking.ranking_id, "day", first_ranked_date, last_ranked_date).sum(:share)/n_days
        end
        
        count0 = PastRanking.where("community_id = ? and ranking_id = ? and period = ? and start >= ? and start <= ?",
                                    self.id, past_ranking.ranking_id, "day", first_ranked_date, last_ranked_date).sum(:count0)/n_days
        count1 = PastRanking.where("community_id = ? and ranking_id = ? and period = ? and start >= ? and start <= ?",
                                    self.id, past_ranking.ranking_id, "day", first_ranked_date, last_ranked_date).sum(:count1)/n_days
        
        if self.id == 82
          puts past_ranking.id.to_s + ", " + past_ranking.website_id.to_s + ", " + share.to_s + 
                ", " + award.to_s + ", " + funds.to_s + ", " + period
        end
        PastRanking.create!({:ranking_id => past_ranking.ranking_id, :community_id => self.id,
                             :website_id => past_ranking.website_id, :rank => 0, # rank will be set later
          :tallied_at => self.tallied_at, :share => share, :funds => funds, :award => award, :count0 => count0, :count1 => count1,
          :period => period, :start => first_ranked_date, :latest => last_ranked_date, :end => end_of_period})
      end
    end
    
    # Sort and save monthly and yearly ranks:
    rankpr(tally_cutoff_date)
    
  end
  
  # Update periodic (non-daily) past_rankings ranks for this community; also check totals:
  def rankpr(date_to_process)
    
    monthly_rankings = PastRanking.where("community_id = ? and period = ? and start >= ? and start <= ?",
                self.id, "month", date_to_process.beginning_of_month, date_to_process.end_of_month).order("share DESC, count1 DESC")
    if monthly_rankings.any?
      checkpr(monthly_rankings)
    end
    
    yearly_rankings = PastRanking.where("community_id = ? and period = ? and start >= ? and start <= ?",
                  self.id, "year", date_to_process.beginning_of_year, date_to_process.end_of_year).order("share DESC, count1 DESC")
    if yearly_rankings.any?
      checkpr(yearly_rankings)
    end
    
  end
  
  def checkpr(period_rankings)
    
    rank_sequence = 0
    first_funds = period_rankings[0].funds
    total_deviations = 0.0
    total_awards = 0.0
    total_shares = 0.0
    period_rankings.each do |pr|
      rank_sequence += 1
      pr.rank = rank_sequence
      pr.save
      total_deviations += (pr.funds - first_funds).abs
      total_awards += pr.award
      total_shares += pr.share
    end
      
    if total_deviations > 0.09 # Should be 0.0 but concerned about roundoff.
      puts "Community number " + period_rankings[0].community_id.to_s + " " + period_rankings[0].period +
           "ly fundings deviate by" + total_deviations.to_s
    end
    
    if (total_awards - first_funds).abs > 0.09 # Should be 0.0 but concerned about roundoff.
      puts "Community number " + period_rankings[0].community_id.to_s + " " + period_rankings[0].period +
           "ly awards total $" + total_awards.to_s + " but first_funds = " + first_funds.to_s
    end
    
    if (total_shares - 100.0).abs > 0.09 # Should be 0.0 but concerned about roundoff.
      puts "Community number " + period_rankings[0].community_id.to_s + " " + period_rankings[0].period +
           "ly shares total " + total_shares.to_s + " but should = 100.0 -- rescaling all to fix this."
      
      # This fix is OK for when a community first has blogs added to it; also if a day is missed.
      if total_shares > 0.0
        period_rankings.each do |pr|
          pr.share *= 100.0/total_shares
          pr.save
        end
      end
      
    end
    
  end
  
  
  class << self
    def filter(params={})

      # TODO: Separate the sphinx search
      if params[:q]
        return search(params[:q], :page => params[:page], :per_page => @@per_page, 
                      :order => 'n_websites DESC, country ASC, category ASC, name ASC')
      end

      scope = self
      if sorted = params[:sorted]
        sorted = sorted.downcase.to_sym
        scope = scope.send(sorted) if self.scopes.keys.include?(sorted)
      else
        scope = scope.scoped(:order => 'n_websites DESC, lower(country), lower(category), lower(name)') 
      end

      scope.paginate(:page => params[:page])
    end
        

    # TODO: A community should be marked by admin as featured
    # Should be a named_scope eventually
    def featured
      ids = [82, 96, 175, 51, 52, 81, 5, 205, 59, 3, 151, 116, 109, 223]
      find(:all, :conditions => ["id in (?)", ids]).sort{|a, b| ids.index(a.id) <=> ids.index(b.id)}
    end
  end

end
