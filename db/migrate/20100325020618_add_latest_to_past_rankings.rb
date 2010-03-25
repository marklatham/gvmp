class AddLatestToPastRankings < ActiveRecord::Migration
  def self.up
    add_column :past_rankings, :latest, :date
  end

  def self.down
    remove_column :past_rankings, :latest
  end
end
