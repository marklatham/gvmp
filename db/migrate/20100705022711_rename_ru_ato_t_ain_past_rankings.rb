class RenameRuAtoTAinPastRankings < ActiveRecord::Migration
  def self.up
    rename_column :past_rankings, :ranking_updated_at, :tallied_at
  end

  def self.down
    rename_column :past_rankings, :tallied_at, :ranking_updated_at
  end
end

# tallied_at is NOT when the ranking was last tallied (that's updated_at)! Rather, it is the CUTOFF TIME used when it was last tallied.
# The tally is usually done less than one hour after the cutoff time.
