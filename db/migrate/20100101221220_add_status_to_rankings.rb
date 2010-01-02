class AddStatusToRankings < ActiveRecord::Migration
  def self.up
    add_column :rankings, :status, :string
  end

  def self.down
    remove_column :rankings, :status
  end
end
