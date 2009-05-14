class CreateRankings < ActiveRecord::Migration
  def self.up
    create_table :rankings do |t|
      t.references :community, :website
      t.float :rank
      t.timestamps
    end
    
    add_index :rankings, [:community_id, :website_id], :unique => true
  end
  def self.down
    remove_index :rankings, :column => [:community_id, :website_id]
    drop_table :rankings
  end
end
