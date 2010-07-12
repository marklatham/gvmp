class ChangeUsersColumns < ActiveRecord::Migration
  def self.up
    change_column :users, :login, :string, :limit => 40, :default => "", :null => false
    change_column :users, :name, :string, :limit => 100, :default => "", :null => false
    change_column :users, :email, :string, :limit => 100, :default => "", :null => false
  end

  def self.down
    change_column :users, :login, :string, :limit => 40
    change_column :users, :name, :string, :limit => 100, :default => ""
    change_column :users, :email, :string, :limit => 100
  end
end
