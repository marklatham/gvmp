class Ranking < ActiveRecord::Base
  belongs_to :website
  belongs_to :community
end
