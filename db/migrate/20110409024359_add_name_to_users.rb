class AddNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string, :default => "", :null => false
    add_column :users, :last_name, :string, :default => "", :null => false
  end

  def self.down
    remove_column :users, :last_name
    remove_column :users, :first_name
  end
end
