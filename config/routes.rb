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
  post 'profile/:id/follow', to: 'profile#follow', as: 'follow'
  post 'profile/:id/unfollow', to: 'profile#unfollow', as: 'unfollow'
  post 'profile/:id/accept', to: 'profile#accept', as: 'accept'
  post 'profile/:id/decline', to: 'profile#decline', as: 'decline'
  post 'profile/:id/cancel', to: 'profile#cancel', as: 'cancel'

  get 'profile/:id', to: 'profile#show', as: 'profile'
end
