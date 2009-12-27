class AddAgentToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :agent, :string
  end

  def self.down
    remove_column :votes, :agent
  end
end
