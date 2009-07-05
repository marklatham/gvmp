class AddIpToWebsites < ActiveRecord::Migration
  def self.up
    add_column :websites, :creator_ip, :string
  end

  def self.down
    remove_column :websites, :creator_ip
  end
end
