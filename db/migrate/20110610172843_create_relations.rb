class CreateRelations < ActiveRecord::Migration
  def self.up
    create_table :relations do |t|
      t.integer :community_id
      t.string :name, :default => ""
      t.string :coding, :default => ""
      t.datetime :ended_at
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :relations
  end
end
