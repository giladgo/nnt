Nnt::Application.routes.draw do
  resources :turtles, only: [:index, :show, :create, :new] do
    member do
      put :upvote
      put :downvote
      put :clearvote
    end
  end
  
  resources :users, only: [:show, :create, :new]

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  root :to => 'turtles#index'
end
