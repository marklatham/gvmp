class SetRankingStatusDefault < ActiveRecord::Migration
  def self.up
    change_column_default :rankings, :status, "in"
  end

  def self.down
    change_column_default :rankings, :status, nil
  end
end
