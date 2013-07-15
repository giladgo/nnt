class AuthManager

  def initialize(store)
    @store = store
  end

  def current_user_id
    @store[:user_id]
  end

  def sign_in(user)
    @store[:user_id] = user.id
  end

  def logout
    @store.delete :user_id
    nil
  end
end
