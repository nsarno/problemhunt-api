Rails.application.routes.draw do
  resources :organizations, except: [:new, :edit]
  root to: 'application#index'
  resources :auth, only: [:create]
  resources :users, except: [:new, :edit]
end

