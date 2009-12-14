class AddAwardToPastRankings < ActiveRecord::Migration
  def self.up
    add_column :past_rankings, :funds, :decimal, :precision => 10, :scale => 2, :default => 0.00, :null => 0.00
    add_column :past_rankings, :award, :decimal, :precision => 10, :scale => 2, :default => 0.00, :null => 0.00
  end

  def self.down
    remove_column :past_rankings, :funds
    remove_column :past_rankings, :award
  end
end
