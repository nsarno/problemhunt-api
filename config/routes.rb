Rails.application.routes.draw do

  root to: 'application#index'
  resources :auth, only: [:create]
  resources :users, except: [:new, :edit]

  resources :rooms, except: [:new, :edit], shallow: true do
    resources :registrations, only: [:create, :destroy]
    resources :problems, except: [:new, :edit] do
      resources :upvotes, only: [:create, :destroy]
    end
  end
end
