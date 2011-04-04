class AddFieldsToAuthentications < ActiveRecord::Migration
  def self.up
    add_column :authentications, :token, :string
    add_column :authentications, :secret, :string
    add_column :authentications, :name, :string
    add_column :authentications, :first_name, :string
    add_column :authentications, :last_name, :string
    add_column :authentications, :location, :string
    add_column :authentications, :image, :string
    add_column :authentications, :provider_url, :string
    add_column :authentications, :email, :string
  end

  def self.down
    remove_column :authentications, :email
    remove_column :authentications, :provider_url
    remove_column :authentications, :image
    remove_column :authentications, :location
    remove_column :authentications, :last_name
    remove_column :authentications, :first_name
    remove_column :authentications, :name
    remove_column :authentications, :secret
    remove_column :authentications, :token
  end
end
