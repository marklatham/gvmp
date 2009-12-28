class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.references :community
      t.text :comment
      t.string :ip_address
      t.string :agent
      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
