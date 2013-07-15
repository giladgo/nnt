class SessionsController < ApplicationController

  def login_page
  end

  def login
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      authmgr.sign_in user
      redirect_to root_url
    else
      redirect_to login_url
    end
  end

  def logout
    authmgr.logout
    redirect_to root_path
  end

end
