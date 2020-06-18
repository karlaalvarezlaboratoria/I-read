# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'public#index'
  get '/home', to: 'home#new' 
  
  resources :profiles, :path => "profile/:id"
  resources :bookshelves
  namespace :library do
    root to: 'books#index'
    resources :books do
      resources :reviews
    end
    resources :authors
    resources :publishers
  end

  devise_for :accounts, controllers: {
    registrations: "accounts/registrations",
    omniauth_callbacks: 'accounts/omniauth_callbacks',
    sessions: 'accounts/sessions'
  }

  devise_scope :account do
    post '/sign_up_validation', to: 'accounts/omniauth_callbacks#sign_up_validation'
  end
end
