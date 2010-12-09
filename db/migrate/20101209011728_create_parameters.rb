class CreateParameters < ActiveRecord::Migration
  def self.up
    create_table :parameters do |t|
      t.datetime :as_of, :default => '2000-01-01 00:00:00'
      t.integer :community_id, :default => 0
      t.float :days_full_value, :default => 10.0
      t.float :days_valid, :default => 60.0
      t.float :ranking_formula_denominator, :default => 50.0
      t.float :interpolation_range, :default => 10.0
      t.float :old_votes_weight, :default => 0.0
      t.float :bonus_votes, :default => 0.0
      t.float :spread, :default => 1.0
      t.float :spread_previous, :default => 0.0
      t.datetime :start_voting, :default => '2009-11-30 00:00:00'
      t.float :float1
      t.string :tags, :default => ""
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :parameters
  end
end
