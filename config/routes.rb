Rails.application.routes.draw do
  resources :listings
  devise_for :users
  authenticate :user do
    resources :reservations
  end
  root 'static_pages#home'
  get 'users/new'
  get  'static_pages/home'
  get  'static_pages/help'
  get '/signup', to: 'users#new'
  get '/my_listings', to: 'listings#my_listings'
  get '/my_reservations', to: 'reservations#my_reservations'
end
