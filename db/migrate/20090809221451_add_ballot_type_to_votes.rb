class AddBallotTypeToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :ballot_type, :integer, :default => 0, :null => 0
  end

  def self.down
    remove_column :votes, :ballot_type
  end
end
