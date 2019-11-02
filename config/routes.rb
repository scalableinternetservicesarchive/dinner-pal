Rails.application.routes.draw do
  resources :reservations
  resources :listings
  devise_for :users
  root 'static_pages#home'
  get 'users/new'
  get  'static_pages/home'
  get  'static_pages/help'
  get '/signup', to: 'users#new'
  get '/my_listings', to: 'listings#my_listings'
end
