class ChangeRankingsColumns < ActiveRecord::Migration
  def self.up
    change_column :rankings, :status, :string, :default => "in", :null => false
  end

  def self.down
    change_column :rankings, :status, :string, :default => "in"
  end
end
