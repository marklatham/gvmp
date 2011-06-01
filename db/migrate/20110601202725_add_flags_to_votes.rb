class AddFlagsToVotes < ActiveRecord::Migration
  # Not used in this rails 2 app, but fields added to match rails 3 data structure to facilitate data transfer.
  # In rails 3 app, these data will be set in utils:process_votes.
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
