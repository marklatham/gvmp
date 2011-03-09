class AddTransitionAndWeightToParameters < ActiveRecord::Migration
  def self.up
    add_column :parameters, :transition, :datetime
    add_column :parameters, :no_login_weight, :float, :default => 1.0
  end

  def self.down
    remove_column :parameters, :transition
    remove_column :parameters, :no_login_weight
  end
end
