class AddPlaceToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :place, :string
  end

  def self.down
    remove_column :votes, :place
  end
end
