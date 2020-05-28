# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts, controllers: {
    omniauth_callbacks: 'accounts/omniauth_callbacks'
  }

  devise_scope :account do
    post '/sign_up_validation', to: 'accounts/omniauth_callbacks#sign_up_validation'
  end

  root to: 'home#new'
  get '/', to: 'public#index'
end
