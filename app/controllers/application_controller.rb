# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  before_filter :set_current_user

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '1d9608acf7cb9f67a53b47029c6850f5'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password

  # Checks permission, and redirects to an error page if not sufficient.
  def redirect_if_permission_less_than(required_permission)
    unless @current_user and (@current_user.permission >= required_permission)
      url = url_for login_path
      @page_title = "Permission required"
      @message = "Sorry -- you must be logged in and have permission to do that."
      render :template => 'shared/generic_error'
      return false
    end
  end

  protected

  # Checks for User in session, and redirects to an error page if none found.
  def redirect_unless_logged_in
    if !logged_in?
      url = url_for login_path
      @page_title = "Login required"
      @message = "Sorry -- you must be logged in to do that. You can <a href=\"#{url}\">log in here</a>."
      render :template => 'shared/generic_error'
      return false
    end
  end

  private

  def set_current_user 
    begin
      @current_user = User.find(session[:user_id]) unless session[:user_id].blank?
    rescue ActiveRecord::RecordNotFound => e
      @current_user = nil
      session[:user_id] = nil
    end
  end
  
  def redirect_back_or(path)
    redirect_to :back
    rescue ActionController::RedirectBackError
    redirect_to path
  end
  
end
