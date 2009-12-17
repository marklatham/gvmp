class CreatePosts < ActiveRecord::Migration

# add association:
#	post:  belongs_to :website
#	website:   has_many :posts

  def self.up
    create_table :posts do |t|
      t.references :website
      t.string :headline
      t.string :url
      t.text :body
      t.datetime :posted_at

      t.timestamps
    end

    add_index :posts, :website_id
    add_column :websites, :feed_url, :string

  end

  def self.down
    remove_column :websites, :feed_url
    remove_index :posts, :column => :website_id
    drop_table :posts
  end
end
