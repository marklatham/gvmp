class AddStatusToPastRankings < ActiveRecord::Migration
  def self.up
    add_column :past_rankings, :status, :string
  end

  def self.down
    remove_column :past_rankings, :status
  end
end
