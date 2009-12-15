class AddDeltaIndex < ActiveRecord::Migration
  def self.up
    change_table :communities do |t|
      t.column :delta, :boolean, :default => false
      t.index :delta
    end
    Community.update_all :delta => false
  end

  def self.down
    change_table :communities do |t|
      t.remove :delta
    end
  end
end
