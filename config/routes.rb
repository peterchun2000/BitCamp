Rails.application.routes.draw do
  resources :posts
  
  resources :follows do
    member do
      get :follow
      get :unfollow
    end
  end

  devise_for :users
    get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'home', to: 'home#show'
    get 'me', to: 'me#show', as: 'me'

    root to: 'visitors#index'
    
end
