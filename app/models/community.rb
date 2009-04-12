class Community < ActiveRecord::Base
  
  validates_presence_of :name, :short_name
  validates_presence_of :category, :message => "(Type) can't be blank"
  validates_presence_of :country
  
  validates_length_of :name, :in => 0..50
  validates_length_of :short_name, :in => 0..20
  validates_length_of :category, :in => 0..12
  validates_length_of :country, :in => 0..20
  validates_length_of :prov_state, :in => 0..20
  validates_length_of :city, :in => 0..20

end
