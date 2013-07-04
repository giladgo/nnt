class SessionsController < ApplicationController

  def new
    puts params
  end

  def create
    puts params
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      sign_in user
      redirect_to root_url
    else
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end