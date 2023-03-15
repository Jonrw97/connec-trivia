Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"
  resources :users, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :friendships, only: [:create]
  end
  resources :user_choices, only: [:create]

  resources :questions, only: [:show] do
    resources :assists, only: [:create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
