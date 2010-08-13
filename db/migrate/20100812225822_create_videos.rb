class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title, :default => ""
      t.text :description, :default => ""
      t.string :tags, :default => ""
      t.string :category, :default => ""
      t.string :url, :default => ""
      t.text :transcript, :default => ""

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
