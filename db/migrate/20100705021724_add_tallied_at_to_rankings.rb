class AddTalliedAtToRankings < ActiveRecord::Migration
  def self.up
    add_column :rankings, :tallied_at, :datetime
  end

  def self.down
    remove_column :rankings, :tallied_at
  end
end

# tallied_at is NOT when the ranking was last tallied (that's updated_at)!
# Rather, it is the CUTOFF TIME used when it was last tallied.
# The tally is usually done less than one hour after the cutoff time.
