class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_id, :current_user, :authenticated?, :sign_in
  def current_user_id
    session[:user_id]
  end

  def current_user
    User.find(current_user_id)
  end

  def authenticated?
    not current_user_id.nil?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

end
