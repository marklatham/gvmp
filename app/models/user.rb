class User < ActiveRecord::Base
  has_many :authentications
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def apply_omniauth(omniauth, save_it = false)
    case omniauth['provider']
    when 'facebook'
      self.apply_facebook(omniauth)
    end
    self.email = omniauth['user_info']['email'] if email.blank?
    build_authentications(omniauth, save_it)
  end
  
  def build_authentications(omniauth, save_it = false)
    auth_params = {
      :provider => omniauth['provider'],
      :uid => omniauth['uid'],
      :token =>(omniauth['credentials']['token'] rescue nil),
      :secret => omniauth['credentials']['secret'],
      :name => omniauth['user_info']['name'],
      :first_name => omniauth['user_info']['first_name'],
      :last_name => omniauth['user_info']['last_name'],
      :first_name => omniauth['user_info']['first_name'],
      :location => omniauth['user_info']['location'],
      :image => omniauth['user_info']['image'],
      :email => omniauth['user_info']['email'],
      :yaml => omniauth.to_yaml # Can be useful to see all this info during development.
      }
    if save_it
      authentications.create!(auth_params)
    else
      authentications.build(auth_params)
    end
  end
  
  def apply_omniauth!(omniauth)
    apply_omniauth(omniauth, true)
  end
  
  def facebook
    @fb_user ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token)
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  
  protected

  def apply_facebook(omniauth)
    if (extra = omniauth['extra']['user_hash'] rescue false)
      self.email = (extra['email'] rescue '')
    end
  end
  
end
