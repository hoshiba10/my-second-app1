Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  root to: 'top_pages#index'
  get 'signup', to: 'people#new'
  
  resources :people do
    member do
      get :followings
      get :followers
    end
  end
    
  resources :tweets
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

end