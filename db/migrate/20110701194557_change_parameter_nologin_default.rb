class ChangeParameterNologinDefault < ActiveRecord::Migration
  def self.up
    change_column :parameters, :no_login_weight, :float, :default => "0.1"
  end
  
  def self.down
    change_column :parameters, :no_login_weight, :float, :default => "1.0"
  end
end
