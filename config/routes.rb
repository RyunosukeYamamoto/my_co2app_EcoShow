Rails.application.routes.draw do
  root to: 'ecos#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :ecos, except: [:show]
  resources :users, only: [:show, :create]
end
