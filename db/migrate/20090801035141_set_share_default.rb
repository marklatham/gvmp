class SetShareDefault < ActiveRecord::Migration
  def self.up
    change_column_default :rankings, :share, 0.0
  end

  def self.down
    change_column_default :rankings, :share, nil
  end
end
