class AddStatusToCommunities < ActiveRecord::Migration
  def self.up
    add_column :communities, :status, :text
  end

  def self.down
    remove_column :communities, :status
  end
end
