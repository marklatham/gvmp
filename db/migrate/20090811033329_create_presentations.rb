class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.date :pdate
      t.string :place
      t.string :host

      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end
