class AddGuidToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :guid, :string
    add_column :posts, :summary, :text
  end

  def self.down
    remove_column :posts, :summary
    remove_column :posts, :guid
  end
end
