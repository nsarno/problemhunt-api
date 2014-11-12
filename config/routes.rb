Rails.application.routes.draw do

  root to: 'application#index'
  resources :auth, only: [:create]
  resources :users, except: [:new, :edit]

  resources :rooms, except: [:new, :edit] do
    resources :problems, except: [:new, :edit]
  end

  resources :upvotes, only: [:create, :destroy]
end
