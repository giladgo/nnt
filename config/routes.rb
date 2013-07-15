Nnt::Application.routes.draw do
  resources :turtles, only: [:index, :show, :create, :new] do
    resources :votes, only: [:index]
  end

  resources :votes, only: [:create, :destroy]
  
  resources :users, only: [:show, :create, :new] do
    collection do
      get :current
    end
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :login
    delete 'logout' => :logout
  end

  root :to => 'turtles#index'
end
