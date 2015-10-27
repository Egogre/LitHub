class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    flash[:notice] = "Login successful"
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end

  def failure
    flash[:notice] = params[:message] # if using sinatra-flash or rack-flash
    redirect_to root_path
  end

  def show
    if current_user
      true
    else
      flash[:notice] = "You must login to view your data"
      redirect_to root_path
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
