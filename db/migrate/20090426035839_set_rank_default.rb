class SetRankDefault < ActiveRecord::Migration
  def self.up
    change_column_default :rankings, :rank, 0.0
  end

  def self.down
    change_column_default :rankings, :rank
  end
end
