class AddShareToRankings < ActiveRecord::Migration
  def self.up
    add_column :rankings, :share, :float
    add_column :rankings, :sequence, :integer
# [called it "sequence" because old system has a field "rank"]
    add_column :rankings, :count0, :float
    add_column :rankings, :count1, :float
  end

  def self.down
    remove_column :rankings, :share
    remove_column :rankings, :sequence
    remove_column :rankings, :count0
    remove_column :rankings, :count1
  end
end
