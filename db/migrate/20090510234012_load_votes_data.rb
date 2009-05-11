require 'active_record/fixtures'
 
class LoadVotesData < ActiveRecord::Migration
 
  def self.up
 
    down
    directory = File.dirname(__FILE__) + "/data"
    Fixtures.create_fixtures(directory, "votes")
  end
 
  def self.down
    Vote.delete_all
  end
 
end
