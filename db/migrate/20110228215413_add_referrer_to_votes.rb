class AddReferrerToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :referrer, :string, :default => ""
  end

  def self.down
    remove_column :votes, :referrer
  end
end
