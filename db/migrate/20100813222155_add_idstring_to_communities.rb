class AddIdstringToCommunities < ActiveRecord::Migration
  def self.up
    add_column :communities, :idstring, :string, :default => ""
  end

  def self.down
    remove_column :communities, :idstring
  end
end
