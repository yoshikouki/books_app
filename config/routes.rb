# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :books
  root 'books#index'
end
