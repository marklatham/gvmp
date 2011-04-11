class AuthenticationsController < ApplicationController
  load_and_authorize_resource
  def index
    @authentications = current_user.authentications if current_user
  end

  def show
    @authentication = Authentication.find(params[:id])
  end

  def new
    @authentication = Authentication.new
  end

  def create
    omniauth = request.env["omniauth.auth"]
    # render :text => omniauth.to_yaml # Can be useful during development.
    # puts omniauth.to_yaml # Can be useful during development.
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.apply_omniauth!(omniauth)
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      unless omniauth['user_info']['email'].blank?  # Shouldn't be blank if auth by Facebook.
        if user = User.find_by_email(omniauth['user_info']['email'])
          unless user.confirmed_at
            user.delete
            user = User.new
          else
            # This is the only case where we don't create a new user: existing user with same email confirmed.
          end
        else
          user = User.new
        end
      else
        user = User.new
      end
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth
        redirect_to new_user_registration_url
      end
    end
  end

  def edit
    @authentication = Authentication.find(params[:id])
  end

  def update
    @authentication = Authentication.find(params[:id])
    if @authentication.update_attributes(params[:authentication])
      redirect_to @authentication, :notice  => "Successfully updated authentication."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
