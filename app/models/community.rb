class Community < ActiveRecord::Base
  # TODO: protect attributes from mass-assignment
  
  #acts_as_ferret :fields => [:name, :short_name]
  
  has_many :rankings do
    def with_websites
      # sort first on rank, then on created_at; pass both values to caller
      map{|ranking| { :rank => ranking.rank, :created_at => ranking.created_at, :website => ranking.website }}.sort_by {
                      |website_and_ranking| [website_and_ranking[:rank], website_and_ranking[:created_at]] }.reverse
    end
  end
  has_many :websites, :through => :rankings
  
  validates_presence_of :name, :short_name
  validates_presence_of :category, :message => "(Type) can't be blank"
  
  validates_length_of :name, :maximum => 50
  validates_length_of :short_name, :maximum => 20, :message => ": please shorten to 20 characters or less"
  validates_length_of :category, :maximum => 20
  validates_length_of :country, :maximum => 30
  validates_length_of :prov_state, :maximum => 30
  validates_length_of :city, :maximum => 30

  # Required by sphinx
  define_index do
    indexes name, short_name, category, country, prov_state, city, scope
  end

end
