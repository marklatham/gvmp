class AddWeightsToParameters < ActiveRecord::Migration
  def self.up
    add_column :parameters, :email_only_weight, :float, :default => 0.2
    add_column :parameters, :fb_login_weight, :float, :default => 0.5
    add_column :parameters, :email_membership_weight, :float, :default => 1.0
    add_column :parameters, :fb_membership_weight, :float, :default => 1.0
  end

  def self.down
    remove_column :parameters, :fb_membership_weight
    remove_column :parameters, :email_membership_weight
    remove_column :parameters, :fb_login_weight
    remove_column :parameters, :email_only_weight
  end
end
