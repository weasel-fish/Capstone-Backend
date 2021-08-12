Rails.application.routes.draw do
  resources :alerts, only: [:index, :show, :create, :destroy]
  resources :sightings
  resources :wish_list_animals, only: [:index, :show, :create, :destroy]
  resources :animals
  resources :outing_invites, only: [:create]
  resources :user_outings, only: [:create, :destroy]
  resources :follows, only: [:create]
  resources :outings
  resources :users
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/me', to: 'sessions#me'
  get '/sessions', to: 'sessions#index'
  delete '/follows/:follower_id/:followee_id', to: 'follows#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
