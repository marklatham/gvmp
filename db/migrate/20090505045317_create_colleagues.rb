class CreateColleagues < ActiveRecord::Migration
  def self.up
    create_table :colleagues do |t|
      t.string :given_name
      t.string :family_name
      t.string :role
      t.string :email
      t.string :photo
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :colleagues
  end
end
