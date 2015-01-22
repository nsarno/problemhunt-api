Rails.application.routes.draw do

  root to: 'application#index'
  resources :auth, only: [:create]
  resources :users, except: [:new, :edit]

  resources :rooms, except: [:new, :edit], shallow: true do
    member do
      post :follow, to: 'registrations#create'
      delete :unfollow, to: 'registrations#destroy'
    end

    resources :problems, except: [:new, :edit] do
      member do
        post :upvote, to: 'upvotes#create'
        delete :downvote, to: 'upvotes#destroy'
      end
    end
  end
end
