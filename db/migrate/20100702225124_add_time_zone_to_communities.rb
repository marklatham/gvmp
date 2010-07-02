class AddTimeZoneToCommunities < ActiveRecord::Migration
  def self.up
    add_column :communities, :time_zone, :string, :default => "Pacific Time (US & Canada)", :null => "Pacific Time (US & Canada)"
  end

  def self.down
    remove_column :communities, :time_zone
  end
end

# Since time zone is mainly used to determine the cutoff time for daily vote tallies, we default to Pacific time for several reasons:
# - At this early stage, most of our communities are in that time zone.
# - Pacific zone is at the trailing edge of many communities, e.g. Canadian & U.S. national communities. So by cutting
# off at midnight Pacific time, voters in the rest of the country are asleep so it works as a cutoff for them too.
# Whereas if we cut off at midnight Eastern time, Pacific voters are still awake and voting.
# Likewise for international organizations with most voters in Europe, Africa and the Americas.
# Even for globally distributed communities, there's a pretty good argument for waiting until Pacific time midnight, though not as strong.
