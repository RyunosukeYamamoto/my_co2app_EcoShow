Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'my_index', to: 'toppages#my_index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :ecos, except: [:index, :show]
  resources :users, only: [:show, :create, :edit, :update]
end
