Rails.application.routes.draw do
  resources :levels
  resources :mobs
  resources :players
  resources :weapons
  root to:'home#index'
  get '/home' => 'home#index'
  get '/signup' => 'players#new'
   post '/players' => 'players#create'

   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'
   get '/signout' => 'sessions#destroy'
 end
