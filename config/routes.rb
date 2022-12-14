Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'friendships/update'
  get 'friendships/create'
  get 'friendships/destroy'
  resources :restaurants, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end

  post "/geolocate", to: "restaurants#geolocate", as: :geolocate

  resources :reviews do
    resources :likes, only: %i[create]
  end
  resources :likes, only: %i[destroy]

  resources :reviews
  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end

  resources :users, only: [:show] do
    resources :bookmarks, only: %i[new create index destroy]
    resources :friendships
  end
  resources :bookmarks, only: %i[destroy]
end
