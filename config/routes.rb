Nnt::Application.routes.draw do
  resources :turtles
  resources :users

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  root :to => 'turtles#index'
end
