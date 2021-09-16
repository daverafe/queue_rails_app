class SessionsController < ApplicationController
  skip_before_action :authenticate_user, except: [:destroy]
  
  def new
    if logged_in?
      redirect_to home_path
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect_to home_path
    else
      render :new 
    end
  end

  def destroy
    session.delete :user_id 
    redirect_to root_path 
  end

  def omniauth 
    user = User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
      u.username = auth[:info][:name]
      u.email = auth[:info][:email]
      u.password = SecureRandom.hex(15)
    end
    if user.valid?
      session[:user_id] = user.id 
      redirect_to home_path
    else
      redirect_to login_path 
    end
  end
  private
  def auth 
    request.env['omniauth.auth']
  end
end

