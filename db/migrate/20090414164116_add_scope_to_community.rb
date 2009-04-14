class AddScopeToCommunity < ActiveRecord::Migration
  def self.up
    add_column :communities, :scope, :string
  end

  def self.down
    remove_column :communities, :scope
  end
end
