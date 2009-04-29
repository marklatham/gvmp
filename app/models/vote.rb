class Vote < ActiveRecord::Base
  belongs_to :community
  belongs_to :website
  
end
