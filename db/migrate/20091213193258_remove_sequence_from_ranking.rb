class RemoveSequenceFromRanking < ActiveRecord::Migration
  def self.up
    remove_column :rankings, :sequence
# [No longer needed because changed "rank" to integer.]
  end

  def self.down
    add_column :rankings, :sequence, :integer
  end
end
