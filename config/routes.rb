# frozen_string_literal: true

Rails.application.routes.draw do
  get 'bookshelves/index'
  get 'bookshelves/new'
  get 'bookshelves/edit'
  namespace :library do
    get 'publishers/index'
    get 'publishers/new'
    get 'publishers/edit'
  end
  namespace :library do
    get 'authors/index'
    get 'authors/new'
    get 'authors/edit'
  end
  devise_for :accounts, controllers: {
    omniauth_callbacks: 'accounts/omniauth_callbacks',
    sessions: 'accounts/sessions'
  }

  devise_scope :account do
    post '/sign_up_validation', to: 'accounts/omniauth_callbacks#sign_up_validation'
    resources :bookshelves
  end

  root to: 'public#index'
  get '/home', to: 'home#new'

  namespace :library do
    root to: 'books#index'
    resources :books
    resources :authors
    resources :publishers
  end
end
