class ChangeRankToInteger < ActiveRecord::Migration
  def self.up
    change_column :rankings, :rank, :integer
# ["rank" used to be a vote tally, and decayed votes are float. But now "rank" is just the integer rank of a website.]
  end

  def self.down
    change_column :rankings, :rank, :float
  end
end
