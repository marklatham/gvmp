class Website < ActiveRecord::Base
  has_many :votes
  has_many :rankings
  has_many :communities, :through => :rankings
  has_many :past_rankings
  has_many :posts

  default_scope :order => "id DESC"
  
  validates_presence_of :url
  
  # TODO: website should be unique in community

  def ranked_for?(community)
    self.communities.include?(community)
  end

end
