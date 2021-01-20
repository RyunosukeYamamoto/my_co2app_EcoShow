Rails.application.routes.draw do
  root to: 'ecos#index'
  
  resources :ecos, except: [:show]
end
