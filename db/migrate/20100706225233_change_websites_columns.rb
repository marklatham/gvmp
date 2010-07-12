class ChangeWebsitesColumns < ActiveRecord::Migration
  def self.up
    change_column :websites, :url, :string, :default => "", :null => false
    change_column :websites, :title, :string, :default => "", :null => false
    change_column :websites, :creator_ip, :string, :default => "", :null => false
    change_column :websites, :feed_url, :string, :default => "", :null => false
  end

  def self.down
    change_column :websites, :url, :string
    change_column :websites, :title, :string
    change_column :websites, :creator_ip, :string
    change_column :websites, :feed_url, :string
  end
end
