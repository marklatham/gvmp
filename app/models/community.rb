class Community < ActiveRecord::Base
  
  has_and_belongs_to_many :websites
  
  validates_presence_of :name, :short_name
  validates_presence_of :category, :message => "(Type) can't be blank"
  
  validates_length_of :name, :maximum => 50
  validates_length_of :short_name, :maximum => 20
  validates_length_of :category, :maximum => 20
  validates_length_of :country, :maximum => 20
  validates_length_of :prov_state, :maximum => 20
  validates_length_of :city, :maximum => 30

end
