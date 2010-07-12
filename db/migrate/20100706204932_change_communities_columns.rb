class ChangeCommunitiesColumns < ActiveRecord::Migration
  def self.up
    change_column :communities, :name, :string, :default => "", :null => false
    change_column :communities, :short_name, :string, :default => "", :null => false
    change_column :communities, :category, :string, :default => "", :null => false
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
    change_column :communities, :delta, :boolean, :default => false
    change_column :communities, :status, :text, :default => "", :null => false
    change_column :communities, :time_zone, :string, :default => "Pacific Time (US & Canada)", :null => false
    change_column :communities, :tallied_at, :datetime, :default => "2000-01-01 00:00:00"
    change_column :communities, :n_websites, :integer, :default => 0
  end

  def self.down
    change_column :communities, :name, :string
    change_column :communities, :short_name, :string
    change_column :communities, :category, :string
    change_column :communities, :country, :string
    change_column :communities, :prov_state, :string
    change_column :communities, :city, :string
    change_column :communities, :official_url, :string
    change_column :communities, :wiki_url, :string
    change_column :communities, :description, :text
    change_column :communities, :scope, :string
    change_column :communities, :add_to_description, :text
    change_column :communities, :creator_ip, :string
    change_column :communities, :adder_ip, :string
    change_column :communities, :delta, :boolean, :default => false
    change_column :communities, :status, :text
    change_column :communities, :time_zone, :string, :default => "Pacific Time (US & Canada)"
    change_column :communities, :tallied_at, :datetime
    change_column :communities, :n_websites, :integer, :default => 0
  end
end
