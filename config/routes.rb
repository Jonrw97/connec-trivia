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
  resource :users, only: [:show]

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  resources :friendships, only: [:destroy, :update]
end
