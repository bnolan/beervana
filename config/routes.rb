Beervana::Application.routes.draw do
  get 'auth/:service/callback' => 'sessions#callback'
  post 'auth/:service/callback' => 'sessions#callback'
  get 'auth/failure' => 'sessions#failure'
  get 'signout' => 'sessions#destroy'
  get 'leaderboard' => 'dashboard#leaderboard', :as => :leaderboard
  
  resources :sessions
  resources :drinks
  resources :users
  resources :beers
  
  root 'dashboard#index'
end
