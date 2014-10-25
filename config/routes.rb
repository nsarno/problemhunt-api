Rails.application.routes.draw do
  resources :problems, except: [:new, :edit]
  resources :organizations, except: [:new, :edit]
  root to: 'application#index'
  resources :auth, only: [:create]
  resources :users, except: [:new, :edit]
end

