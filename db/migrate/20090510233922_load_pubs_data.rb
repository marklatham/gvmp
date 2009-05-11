require 'active_record/fixtures'
 
class LoadPubsData < ActiveRecord::Migration
  
  def self.up
    down
    directory = File.dirname(__FILE__) + "/data"
    Fixtures.create_fixtures(directory, "pubs")
  end
  
  def self.down
    Pub.delete_all
  end
end
