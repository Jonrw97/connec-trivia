Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :friendships, only: [:create]
  end
  resources :user_choices, only: [:create]

  resource :questions, only: [:show] do
    resources :assists, only: [:create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
