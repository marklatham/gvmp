class AddPermissionToUsersAgain < ActiveRecord::Migration
  # First step in very simple stepwise implementation of cancan: First reproduce old functionality of rails 2 app.
  def self.up
    add_column :users, :permission, :decimal, :precision => 8, :scale => 3, :default => 0.0
  end

  def self.down
    remove_column :users, :permission
  end
end
