class AddZoneToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :zone, :integer, :default => 0
  end

  def self.down
    remove_column :votes, :zone
  end
end
