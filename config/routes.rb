Nnt::Application.routes.draw do
  resources :turtles

  root :to => 'turtles#index'
end
