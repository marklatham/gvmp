class AddZonesToParameters < ActiveRecord::Migration
  def self.up
    add_column :parameters, :zone1, :float, :default => 1.0
    add_column :parameters, :zone2, :float, :default => 1.0
    add_column :parameters, :zone3, :float, :default => 1.0
    add_column :parameters, :zone4, :float, :default => 1.0
    add_column :parameters, :zone9, :float, :default => 1.0
  end

  def self.down
    remove_column :parameters, :zone1
    remove_column :parameters, :zone2
    remove_column :parameters, :zone3
    remove_column :parameters, :zone4
    remove_column :parameters, :zone9
  end
end
