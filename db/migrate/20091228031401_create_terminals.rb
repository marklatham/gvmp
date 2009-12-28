class CreateTerminals < ActiveRecord::Migration
  def self.up
    create_table :terminals do |t|
      t.string :location
      t.string :access
      t.string :connect
      t.string :machine
      t.string :notes
      t.string :ip_address
      t.string :agent
      t.timestamps
    end
  end

  def self.down
    drop_table :terminals
  end
end
