class ChangeRankDefault < ActiveRecord::Migration
  
  # So that newly added website gets ranked at the bottom of the ballot:
  def self.up
    change_column_default :rankings, :rank, 999
  end

  def self.down
    change_column_default :rankings, :rank, 0
  end
end
