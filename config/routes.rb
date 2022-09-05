Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'users/show'
  get 'restaurants/index'
  get 'restaurants/show'
  get 'reviews/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
