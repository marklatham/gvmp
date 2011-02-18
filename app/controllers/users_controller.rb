class UsersController < ApplicationController

  before_filter :except => [:new, :create] do |c|
    c.redirect_if_permission_less_than 7.0
  end

  def index
    @users = User.order("id")
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      @user.ip_address = request.remote_ip
      @user.agent = request.user_agent
      @user.save
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      notify("Login created -- welcome to the VoterMedia.org community!", :info)
    else
      notify("We couldn't set up that login, sorry.  Please try again, or contact an admin (see About/Contact page).", :error)
      render :action => 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        notify('User was successfully updated.', :sucess)
        format.html { redirect_to(users_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

end
