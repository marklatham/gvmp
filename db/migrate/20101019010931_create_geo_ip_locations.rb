class CreateGeoIpLocations < ActiveRecord::Migration
  def self.up
    create_table :geo_ip_locations do |t|
      t.string :country, :default => ""
      t.string :region, :default => ""
      t.string :city, :default => ""
      t.string :postal_code, :default => ""
      t.float :latitude
      t.float :longitude
      t.string :metro_code, :default => ""
      t.string :area_code, :default => ""
      t.timestamps
    end
  end

  def self.down
    drop_table :geo_ip_locations
  end
end
