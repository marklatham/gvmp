require 'active_record/fixtures'
 
class LoadFaqsData < ActiveRecord::Migration
  
  def self.up
    down
    directory = File.dirname(__FILE__) + "/data"
    Fixtures.create_fixtures(directory, "faqs")
  end
  
  def self.down
    Faq.delete_all
  end
end
