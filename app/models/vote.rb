class Vote < ActiveRecord::Base
  belongs_to :community
  belongs_to :website
  
  #todo need to record ip as well
  def self.vote_for_website ip, community, website
    
    vote_row = Vote.new({:ip_address => ip, :community_id => community.id, :website_id =>website.id})
    vote_row.save
    
    #this is temp --very bad implementation -- until a ranking scheme is defined
    website_rank_in_community = Ranking.find(:first, :conditions => ["community_id = ? and website_id = ?", community, website])
    website_rank_in_community.rank = website.votes.count
    website_rank_in_community.save
  end
end
