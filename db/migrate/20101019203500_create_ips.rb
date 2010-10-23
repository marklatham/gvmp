class CreateIps < ActiveRecord::Migration
  def self.up
    create_table :ips do |t|
      t.string :ip_address, :default => ""
      t.integer :integer_ip, :limit => 20
      # The above line doesn't create a bigint field in MySQL! So change that fields manually.
      t.integer :geo_ip_location_id
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
    add_index(:ips, :ip_address)
  end

  def self.down
    drop_table :ips
  end
end
