Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  resources :account_activations, only: [:edit]
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
