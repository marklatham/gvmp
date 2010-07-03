class AddTalliedAtToCommunities < ActiveRecord::Migration
  def self.up
    add_column :communities, :tallied_at, :datetime
  end

  def self.down
    remove_column :communities, :tallied_at
  end
end

# tallied_at is NOT when the community was last tallied! Rather, it is the CUTOFF TIME used when it was last tallied.
# The tally is usually done less than one hour after the cutoff time.