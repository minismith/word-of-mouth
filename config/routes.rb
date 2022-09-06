Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :restaurants, only: %i[index show new create]
  resources :reviews
  resources :users, only: [:show] do
    resources :bookmarks, only: %i[new create index delete]
    resources :friendships
  end
end
