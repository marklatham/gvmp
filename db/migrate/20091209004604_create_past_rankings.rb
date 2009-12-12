class CreatePastRankings < ActiveRecord::Migration
  def self.up
    create_table :past_rankings do |t|
      t.integer :ranking_id
      t.references :community, :website
      t.float :rank
      t.datetime :ranking_updated_at
      t.float :share
      t.integer :sequence
      t.float :count0
      t.float :count1
      t.timestamps
    end
    
    add_index :past_rankings, [:community_id, :website_id]
  end

  def self.down
    remove_index :past_rankings, :column => [:community_id, :website_id]
    drop_table :past_rankings
  end
end
