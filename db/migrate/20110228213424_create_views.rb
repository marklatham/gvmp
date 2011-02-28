class CreateViews < ActiveRecord::Migration
  def self.up
    create_table :views do |t|
      t.references :user, :community
      t.string :ip_address,       :default => ""
      t.string :agent,            :default => ""
      t.string :referrer,         :default => ""

      t.timestamps
    end
  end

  def self.down
    drop_table :views
  end
end
