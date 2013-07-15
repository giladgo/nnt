class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :authenticated?, :sign_in
  def current_user_id
    session[:user_id]
  end

  def current_user
    @current_user ||= (current_user_id.present?) ? User.find(current_user_id) : nil
  end

  def authenticated?
    current_user.present?
  end

  # Move to sessions controller
  # assumption: user has been authenticated
  def sign_in(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete :user_id
    nil
  end

end
