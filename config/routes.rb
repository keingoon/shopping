require 'sidekiq/web'
require 'sidekiq/cron/web'


Rails.application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq" # localhost/sidekiq でsidekiq管理画面にアクセスできる

  namespace :admin do
    get 'login', to:'sessions#new'
    post 'login', to:'sessions#create'
    delete '/logout', to:'sessions#destroy'
    resources :companies
    resources :administrators
    resources :products
    resources :users, only: [:index, :show, :destroy]
  end
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :products
  resources :companies
  resources :carts
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
