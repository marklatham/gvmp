class IndexCommunitiesIdString < ActiveRecord::Migration
  def self.up
    add_index(:communities, :idstring)
  end

  def self.down
    remove_index(:communities, :idstring)
  end
end
