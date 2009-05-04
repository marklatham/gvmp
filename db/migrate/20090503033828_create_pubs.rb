class CreatePubs < ActiveRecord::Migration
  def self.up
    create_table :pubs do |t|
      t.date :date_sequence
      t.string :date_text
      t.string :title
      t.string :country
      t.string :journal

      t.timestamps
    end
  end

  def self.down
    drop_table :pubs
  end
end
