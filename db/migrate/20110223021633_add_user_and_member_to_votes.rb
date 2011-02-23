class AddUserAndMemberToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :user_id, :integer
    add_column :votes, :member, :string, :default => "" # member of which communities?
  end

  def self.down
    remove_column :votes, :user_id
    remove_column :votes, :member
  end
end
