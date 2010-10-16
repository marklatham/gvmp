class AddIpAddressAndAgentToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :ip_address, :string, :default => ""
    add_column :users, :agent, :string, :default => ""
  end

  def self.down
    remove_column :users, :ip_address
    remove_column :users, :agent
  end
end
