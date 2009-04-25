class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.string :ip_address
      t.integer :community_id
      t.integer :website_id
      t.float :support

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
