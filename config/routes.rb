Rails.application.routes.draw do
  namespace :admin do
    get 'login', to:'sessions#new'
    post 'login', to:'sessions#create'
    delete '/logout', to:'sessions#destroy'
    resources :companies
    resources :administrators
    resources :products
  end
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
