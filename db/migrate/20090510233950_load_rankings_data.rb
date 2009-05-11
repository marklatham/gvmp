require 'active_record/fixtures'
class LoadRankingsData < ActiveRecord::Migration
  def self.up
  
    down
    directory = File.dirname(__FILE__) + "/data"
    Fixtures.create_fixtures(directory, "rankings")
  end
  def self.down
    Ranking.delete_all
  end
end
