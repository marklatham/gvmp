class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :ip_string
      t.string :name
      t.string :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
