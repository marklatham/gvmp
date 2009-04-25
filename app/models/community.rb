class Community < ActiveRecord::Base

  has_many :rankings do
    def with_websites
      map{|ranking| { :rank => ranking.rank, :website => ranking.website }}.sort_by { |website_and_rank| website_and_rank[:rank] }.reverse
    end
  end
  has_many :websites, :through => :rankings
  
  validates_presence_of :name, :short_name
  validates_presence_of :category, :message => "(Type) can't be blank"
  
  validates_length_of :name, :maximum => 50
  validates_length_of :short_name, :maximum => 20
  validates_length_of :category, :maximum => 20
  validates_length_of :country, :maximum => 20
  validates_length_of :prov_state, :maximum => 20
  validates_length_of :city, :maximum => 30

end
