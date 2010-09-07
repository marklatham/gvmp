class AddShowTextToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :show_text, :text, :default => ""
  end

  def self.down
    remove_column :posts, :show_text
  end
end
