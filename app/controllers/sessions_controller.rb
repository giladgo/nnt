class SessionsController < ApplicationController

  def new
  end

  def login
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      sign_in user
      redirect_to root_url
    else
      redirect_to login_url
    end
  end

  def logout
    logout
    redirect_to root_path
  end

end
