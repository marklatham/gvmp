require 'active_record/fixtures'
class LoadCommunitiesData < ActiveRecord::Migration
  def self.up
  
    down
    directory = File.dirname(__FILE__) + "/data"
    Fixtures.create_fixtures(directory, "communities")
  end
  def self.down
    Community.delete_all
  end
end
