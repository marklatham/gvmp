class ChangePastRankingsColumns < ActiveRecord::Migration
  def self.up
    change_column :past_rankings, :status, :string, :default => "", :null => false
    change_column :past_rankings, :period, :string, :default => "", :null => false
  end

  def self.down
    change_column :past_rankings, :status, :string
    change_column :past_rankings, :period, :string
  end
end
