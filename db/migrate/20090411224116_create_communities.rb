class CreateCommunities < ActiveRecord::Migration
  def self.up
    create_table :communities do |t|
      t.string :name
      t.string :short_name
      t.string :category
      t.string :country
      t.string :prov_state
      t.string :city
      t.string :official_url
      t.string :wiki_url
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :communities
  end
end
