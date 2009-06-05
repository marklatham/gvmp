class AddPermissionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :permission, :decimal, :precision => 8, :scale => 3, :default => 0.00, :null => 0.00
    User.find(:all, :conditions => "login in ('topadmin')").each{|u| u.update_attribute(:permission, 9.0)}
  end

  def self.down
    remove_column :users, :permission
  end
end
