Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'friendships/update'
  get 'friendships/create'
  get 'friendships/destroy'
  resources :restaurants, only: %i[index show new create]
  resources :reviews
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :users, only: [:show] do
    resources :bookmarks, only: %i[new create index delete]
    resources :friendships
  end
end
