class ChangeVotesColumns < ActiveRecord::Migration
  def self.up
    change_column :votes, :ip_address, :string, :default => "", :null => false
    change_column :votes, :agent, :string, :default => "", :null => false
    change_column :votes, :place, :string, :default => "", :null => false
  end

  def self.down
    change_column :votes, :ip_address, :string
    change_column :votes, :agent, :string
    change_column :votes, :place, :string
  end
end
