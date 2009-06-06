class IndexCommunities < ActiveRecord::Migration
  def self.up
    add_index(:communities, :name)
    add_index(:communities, :short_name)
    add_index(:communities, :category)
    add_index(:communities, :country)
    add_index(:communities, :prov_state)
    add_index(:communities, :city)
    add_index(:communities, :scope)
  end

  def self.down
    remove_index(:communities, :name)
    remove_index(:communities, :short_name)
    remove_index(:communities, :category)
    remove_index(:communities, :country)
    remove_index(:communities, :prov_state)
    remove_index(:communities, :city)
    remove_index(:communities, :scope)
  end
end
