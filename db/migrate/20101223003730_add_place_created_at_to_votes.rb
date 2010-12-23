class AddPlaceCreatedAtToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :place_created_at, :datetime # = place.created_at if vote.ip_address matches place.ip_string
  end

  def self.down
    remove_column :votes, :place_created_at
  end
end
