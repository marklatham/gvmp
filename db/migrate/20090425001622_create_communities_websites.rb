class CreateCommunitiesWebsites < ActiveRecord::Migration
  def self.up
    create_table :communities_websites, :id => false do |t|
      t.integer :community_id, :null => false
      t.integer :website_id, :null => false
      t.float :rank
      
      t.timestamps
    end
    
    add_index :communities_websites, [:community_id, :website_id], :unique => true
  end
 
  def self.down
    remove_index :communities_websites, :column => [:community_id, :website_id]
    drop_table :communities_websites
  end
end
