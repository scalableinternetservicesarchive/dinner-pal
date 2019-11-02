Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get 'users/new'
  get  'static_pages/home'
  get  'static_pages/help'
  get '/signup', to: 'users#new'
end
