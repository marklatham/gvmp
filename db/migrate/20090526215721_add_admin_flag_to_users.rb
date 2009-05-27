class AddAdminFlagToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin_user, :boolean, :default => false, :null => false
    User.find(:all, :conditions => "login in ('mlatham')").each{|u| u.update_attribute(:admin_user, true)}
  end

  def self.down
    remove_column :users, :admin_user
  end
end