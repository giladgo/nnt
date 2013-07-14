class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :authenticated?, :sign_in
  def current_user_id
    session[:user_id]
  end

  def current_user
    (not current_user_id.nil?) ? User.find(current_user_id) : nil
  end

  def authenticated?
    not current_user.nil?
  end

  # assumption: user has been authenticated
  def sign_in(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete :user_id
    nil
  end

end
