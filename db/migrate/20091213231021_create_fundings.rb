class CreateFundings < ActiveRecord::Migration
  def self.up
    create_table :fundings do |t|
      t.date :date
      t.references :community
      t.decimal :amount, :precision => 10, :scale => 2, :default => 0.00, :null => 0.00
      t.float :allocated, :default => 0.0, :null => 0.0
      t.timestamps
    end
    
    add_index :fundings, :community_id
  end

  def self.down
    remove_index :fundings, :community_id
    drop_table :fundings
  end
end
