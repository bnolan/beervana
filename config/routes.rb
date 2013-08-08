Beervana::Application.routes.draw do
  get 'signout' => 'sessions#destroy'
  get 'leaderboard' => 'dashboard#leaderboard', :as => :leaderboard
  
  resources :sessions
  resources :drinks
  resources :users
  resources :beers
  
  root 'dashboard#index'
end
