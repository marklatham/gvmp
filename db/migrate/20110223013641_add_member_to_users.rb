class AddMemberToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :member, :string, :default => "" # member of which communities?
  end

  def self.down
    remove_column :users, :member
  end
end
