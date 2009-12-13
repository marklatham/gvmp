class ConformPastRankingToRanking < ActiveRecord::Migration
  def self.up
    change_column :past_rankings, :rank, :integer
    remove_column :past_rankings, :sequence
  end

  def self.down
    change_column :past_rankings, :rank, :float
    add_column :past_rankings, :sequence, :integer
  end
end
