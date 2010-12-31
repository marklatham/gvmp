class AddPagesToPubs < ActiveRecord::Migration
  def self.up
    add_column :pubs, :pages, :float # how many pages long is this publication?
  end

  def self.down
    remove_column :pubs, :pages
  end
end
