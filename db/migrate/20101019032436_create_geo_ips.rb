class CreateGeoIps < ActiveRecord::Migration
  def self.up
    create_table :geo_ips do |t|
      t.integer :start_ip, :limit => 20
      t.integer :end_ip, :limit => 20
      # The above two lines don't create bigint fields in MySQL! So change those fields manually.
      t.integer :geo_ip_location_id
      t.timestamps
    end
    add_index(:geo_ips, :start_ip)
    add_index(:geo_ips, :end_ip)
    add_index(:geo_ips, :geo_ip_location_id)
  end

  def self.down
    drop_table :geo_ips
  end
end
