class AddDaysToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :days, :float # Number of days since the last day this ip voted in this community.
  end

  def self.down
    remove_column :votes, :days
  end
end
