class AddSequenceToColleague < ActiveRecord::Migration
  def self.up
    add_column :colleagues, :sequence, :float
  end

  def self.down
    remove_column :colleagues, :sequence
  end
end
