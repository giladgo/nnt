require 'auth_manager'

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def authmgr
    @authmgr ||= AuthManager.new(session)
  end

  def current_user
    @current_user ||= (authmgr.current_user_id.present? ? User.find(authmgr.current_user_id) : nil)
  end

end
