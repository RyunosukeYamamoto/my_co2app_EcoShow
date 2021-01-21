Rails.application.routes.draw do
  root to: 'ecos#index'
  
  get 'signup', to: 'users#new'
  resources :ecos, except: [:show]
  resources :users, only: [:show, :create]
end
