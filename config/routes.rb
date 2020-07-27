# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
                       controllers: { registrations: 'users/registrations',
                                      omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/:id', to: 'users/registrations#show'
  end
  resources :users, only: [:show]
  resources :books
  root 'books#index'
end
