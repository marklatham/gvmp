class SetCountDefaults < ActiveRecord::Migration
  def self.up
    change_column_default :rankings, :count0, 0.0
    change_column_default :rankings, :count1, 0.0
    change_column_default :rankings, :sequence, 999999
  end

  def self.down
    change_column_default :rankings, :count0, nil
    change_column_default :rankings, :count1, nil
    change_column_default :rankings, :sequence, nil
  end
end
