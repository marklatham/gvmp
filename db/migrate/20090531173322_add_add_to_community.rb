class AddAddToCommunity < ActiveRecord::Migration
  def self.up
    add_column :communities, :add_to_description, :text
  end

  def self.down
    remove_column :communities, :add_to_description
  end
end
