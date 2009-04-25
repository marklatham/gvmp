class Website < ActiveRecord::Base
  has_many :votes
  has_many :rankings
  has_many :communities, :through => :rankings
  
  validates_presence_of :url

  def ranked_for?(community)
    self.communities.include?(community)
  end
  
end
