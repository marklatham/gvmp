class ChangeCommunitiesConditions < ActiveRecord::Migration
  def self.up
    change_column :communities, :country, :string, :default => ""
    change_column :communities, :prov_state, :string, :default => ""
    change_column :communities, :city, :string, :default => ""
    change_column :communities, :official_url, :string, :default => ""
    change_column :communities, :wiki_url, :string, :default => ""
    change_column :communities, :description, :text, :default => ""
    change_column :communities, :scope, :string, :default => ""
    change_column :communities, :add_to_description, :text, :default => ""
    change_column :communities, :creator_ip, :string, :default => ""
    change_column :communities, :adder_ip, :string, :default => ""
    change_column :communities, :status, :text, :default => ""
    change_column :communities, :time_zone, :string, :default => "Pacific Time (US & Canada)"
  end


  def self.down
    change_column :communities, :country, :string, :default => "", :null => false
    change_column :communities, :prov_state, :string, :default => "", :null => false
    change_column :communities, :city, :string, :default => "", :null => false
    change_column :communities, :official_url, :string, :default => "", :null => false
    change_column :communities, :wiki_url, :string, :default => "", :null => false
    change_column :communities, :description, :text, :default => "", :null => false
    change_column :communities, :scope, :string, :default => "", :null => false
    change_column :communities, :add_to_description, :text, :default => "", :null => false
    change_column :communities, :creator_ip, :string, :default => "", :null => false
    change_column :communities, :adder_ip, :string, :default => "", :null => false
    change_column :communities, :status, :text, :default => "", :null => false
    change_column :communities, :time_zone, :string, :default => "Pacific Time (US & Canada)", :null => false
  end
end
