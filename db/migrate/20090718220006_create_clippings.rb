class CreateClippings < ActiveRecord::Migration
  def self.up
    create_table :clippings do |t|
      t.date :date_sequence
      t.string :date_text
      t.string :source
      t.string :source_url
      t.string :author
      t.string :title
      t.string :title_url
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :clippings
  end
end
