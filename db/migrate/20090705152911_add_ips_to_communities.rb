class AddIpsToCommunities < ActiveRecord::Migration
  def self.up
    add_column :communities, :creator_ip, :string
    add_column :communities, :adder_ip, :string
  end

  def self.down
    remove_column :communities, :creator_ip
    remove_column :communities, :adder_ip
  end
end
