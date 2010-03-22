class AddPeriodToPastRankings < ActiveRecord::Migration
  def self.up
    add_column :past_rankings, :period, :string
    add_column :past_rankings, :start, :date
    add_column :past_rankings, :end, :date
  end

  def self.down
    remove_column :past_rankings, :period
    remove_column :past_rankings, :start
    remove_column :past_rankings, :end
  end
end
