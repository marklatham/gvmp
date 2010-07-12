class AddDroppedAtToRankings < ActiveRecord::Migration
  def self.up
    add_column :rankings, :dropped_at, :datetime, :default => "3000-01-01 00:00:00"
  end

  def self.down
    remove_column :rankings, :dropped_at
  end
end
