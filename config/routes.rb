Rails.application.routes.draw do
  root to: 'application#index'
  resources :auth, only: [:create]
  resources :users, except: [:new, :edit]
end

