class User < ActiveRecord::Base
  has_many :authentications
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(
      :provider => omniauth['provider'],
      :uid => omniauth['uid'],
      :token => omniauth['credentials']['token'],
      :secret => omniauth['credentials']['secret'],
      :name => omniauth['user_info']['name'],
      :first_name => omniauth['user_info']['first_name'],
      :last_name => omniauth['user_info']['last_name'],
      :first_name => omniauth['user_info']['first_name'],
      :location => omniauth['user_info']['location'],
      :image => omniauth['user_info']['image'],
      :email => omniauth['user_info']['email']
      )
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  
end
