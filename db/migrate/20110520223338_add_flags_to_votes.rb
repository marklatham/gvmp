class AddFlagsToVotes < ActiveRecord::Migration
  # These data are set in utils:process_votes.
  def self.up
    add_column :votes, :fb_login, :boolean, :default => false # Has a Facebook login?
    add_column :votes, :fb_membership, :boolean, :default => false # Community membership confirmed by Facebook data?
    add_column :votes, :email_membership, :boolean, :default => false # Community membership confirmed by email address?
  end

  def self.down
    remove_column :votes, :email_membership
    remove_column :votes, :fb_membership
    remove_column :votes, :fb_login
  end
end
