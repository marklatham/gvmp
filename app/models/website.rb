class Website < ActiveRecord::Base
  has_many :votes
  has_many :rankings
  has_many :communities, :through => :rankings

  default_scope :order => "id DESC"
  
  validates_presence_of :url
  
  # TODO: website should be unique in community

  def ranked_for?(community)
    self.communities.include?(community)
  end


  class << self
    def build_for_community(community_id, params) 
      if params
        # TODO: handle if community doesn't exist
        community = Community.find(community_id)
        community.websites.create(params)
      else
        new
      end
    end
  end
  
end
