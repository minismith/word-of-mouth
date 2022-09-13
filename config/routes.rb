Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'friendships/update'
  get 'friendships/create'
  get 'friendships/destroy'
  resources :restaurants, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end
  resources :reviews
  resources :users, only: [:show] do
    # resources :bookmarks, only: %i[new create index delete]
    resources :friendships
  end
  resources :bookmarks, only: %i[destroy]
end
