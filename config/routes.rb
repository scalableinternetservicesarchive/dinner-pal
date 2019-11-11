Rails.application.routes.draw do
  resources :listings
  devise_for :users
  authenticate :user do
    resources :reservations
  end
  root 'static_pages#home'
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/signup', to: 'users#new'
  get '/browse', to: 'listings#browse'

  namespace :admin do
    resources :users
    resources :listings
    resources :reservations
    root to: redirect(path: '/admin/users')
  end
end
