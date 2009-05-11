require 'active_record/fixtures'
class LoadColleaguesData < ActiveRecord::Migration
  def self.up
    down
    directory = File.dirname(__FILE__) + "/data"
    Fixtures.create_fixtures(directory, "colleagues")
  end
  def self.down
    Colleague.delete_all
  end
end
