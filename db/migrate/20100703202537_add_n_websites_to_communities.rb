class AddNWebsitesToCommunities < ActiveRecord::Migration
  def self.up
    add_column :communities, :n_websites, :integer, :default => 0
  end

  def self.down
    remove_column :communities, :n_websites
  end
end

# n_websites = the number of websites covering this community
# Update this every time we add or delete a website ranking.
# Since adds/deletes could happen manually, good to update this when tallying too?!
