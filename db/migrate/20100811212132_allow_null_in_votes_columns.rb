class AllowNullInVotesColumns < ActiveRecord::Migration
  def self.up
    change_column :votes, :ip_address, :string, :default => "", :null => true
    change_column :votes, :agent, :string, :default => "", :null => true
    change_column :votes, :place, :string, :default => "", :null => true
  end

  def self.down
    change_column :votes, :ip_address, :string, :default => "", :null => false
    change_column :votes, :agent, :string, :default => "", :null => false
    change_column :votes, :place, :string, :default => "", :null => false
  end
end
