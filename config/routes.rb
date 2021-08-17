Rails.application.routes.draw do
  resources :alerts, only: [:index, :show, :create, :destroy]
  resources :sightings
  resources :wish_list_animals, only: [:index, :show, :create, :destroy]
  resources :animals
  resources :outing_invites, only: [:show, :create, :destroy]
  resources :user_outings, only: [:create]
  resources :follows, only: [:create]
  resources :outings
  resources :users
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/me', to: 'sessions#me'
  get '/sessions', to: 'sessions#index'
  delete '/follows/:follower_id/:followee_id', to: 'follows#destroy'
  get '/frontload', to: 'sessions#front_load'
  post '/accept', to: 'user_outings#accept'
  delete '/leave/:user_id/:outing_id', to: 'user_outings#destroy'
  post '/sightings/with-new', to: 'sightings#create_with_new_animal'
  post '/wishlist/with-new', to: 'wish_list_animals#create_with_new_animal'
  get '/stats', to: 'sightings#get_stats'
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
