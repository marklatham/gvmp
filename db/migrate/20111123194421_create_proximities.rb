class CreateProximities < ActiveRecord::Migration
  def self.up
    create_table :proximities do |t|
      t.references :community
      t.string :country,      :default => ""
      t.string :region,       :default => ""
      t.string :city,         :default => ""
      t.integer :zone
      t.datetime :start_at,   :default => '2000-01-01 00:00:00'
      t.datetime :end_at,     :default => '3000-01-01 00:00:00'
      
      t.timestamps
    end
  end

  def self.down
    drop_table :proximities
  end
end
