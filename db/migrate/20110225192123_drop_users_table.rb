class DropUsersTable < ActiveRecord::Migration
  def self.up
    drop_table "users"
  end

  def self.down
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40, :default => "", :null => false
      t.column :name,                      :string, :limit => 100, :default => "", :null => false
      t.column :email,                     :string, :limit => 100, :default => "", :null => false
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :permission,                :decimal, :precision => 8, :scale => 3, :default => 0.00
      t.column :ip_address,                :string, :default => ""
      t.column :agent,                     :string, :default => ""

    end
    add_index :users, :login, :unique => true
  end
end
