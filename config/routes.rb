Rails.application.routes.draw do
  resources :posts
  devise_for :users
    get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'home', to: 'home#show'
    get 'me', to: 'me#show', as: 'me'
    get 'follow' => "users#follow"
    get 'unfollow' => "users#unfollow"
    get 'search' => "pages#search"

    root to: 'visitors#index'
    
end
