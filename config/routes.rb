Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"
  resources :users, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :friendships, only: [:create]
  end

  resources :results, only: [:index]

  resources :user_choices, only: [:create]

  resources :questions, only: [:show] do
    resources :assists, only: %i[create new]
  end

  resources :assists, only: %i[index edit update]

  resources :friendships, only: %i[destroy update]

  resources :settings, only: :update

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
