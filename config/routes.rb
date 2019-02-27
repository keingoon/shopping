Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
