class SessionsController < ApplicationController

  def create
    user = GithubUser.new(auth_hash)
    session[:current_user] = user
    flash[:notice] = "Login successful"
    redirect_to dashboard_path
  end

  def destroy
    session[:current_user] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end

  def failure
    flash[:notice] = params[:message] # if using sinatra-flash or rack-flash
    redirect_to root_path
  end

  def show
    if current_user
      @user = GithubUser.rebuild(current_user)
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
