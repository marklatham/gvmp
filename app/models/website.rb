class Website < ActiveRecord::Base
  
  has_and_belongs_to_many :communities
  
  validates_presence_of :url
  
  def ranked_for?(community)
    self.communities.include?(community)
  end
  
end
