class AllowNullInPostsColumns < ActiveRecord::Migration
  def self.up
    change_column :posts, :headline, :string, :default => "", :null => true
    change_column :posts, :url, :string, :default => "", :null => true
    change_column :posts, :body, :text, :default => "", :null => true
    change_column :posts, :guid, :string, :default => "", :null => true
    change_column :posts, :summary, :text, :default => "", :null => true
  end

  def self.down
    change_column :posts, :headline, :string, :default => "", :null => false
    change_column :posts, :url, :string, :default => "", :null => false
    change_column :posts, :body, :text, :default => "", :null => false
    change_column :posts, :guid, :string, :default => "", :null => false
    change_column :posts, :summary, :text, :default => "", :null => false
  end
end
