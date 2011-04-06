class AddYamlToAuthentications < ActiveRecord::Migration
  def self.up
    add_column :authentications, :yaml, :text
  end

  def self.down
    remove_column :authentications, :yaml
  end
end
