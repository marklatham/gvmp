class User < ActiveRecord::Base
  has_many :authentications, :dependent => :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  def apply_omniauth(omniauth, save_it = false)
    case omniauth['provider']
    when 'facebook'
      self.apply_facebook(omniauth)
    end
    self.email = omniauth['user_info']['email'] if email.blank?
    self.first_name = omniauth['user_info']['first_name'] if first_name.blank?
    self.last_name = omniauth['user_info']['last_name'] if last_name.blank?
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
      :location => omniauth['user_info']['location'],
      :image => omniauth['user_info']['image'],
      :email => omniauth['user_info']['email'],
      :yaml => omniauth.to_yaml, # Can be useful to see all this info during development.
      :nickname => omniauth['user_info']['nickname']
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
  
  # Callback to overwrite if confirmation is required or not.
  def confirmation_required?
    !confirmed?
  end
  
  protected

  def apply_facebook(omniauth)
    self.email = (omniauth['user_info']['email'] rescue '')
    self.first_name = (omniauth['user_info']['first_name'] rescue '')
    self.last_name = (omniauth['user_info']['last_name'] rescue '')
    self.confirmed_at = Time.now
  end
  
end
