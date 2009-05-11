require 'active_record/fixtures'
class LoadWebsitesData < ActiveRecord::Migration
  def self.up
  
    down
    directory = File.dirname(__FILE__) + "/data"
    Fixtures.create_fixtures(directory, "websites")
  end
  def self.down
    Website.delete_all
  end
end
