# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts, controllers: {
    omniauth_callbacks: 'accounts/omniauth_callbacks'
  }

  post '/sign_up_validaton', to: 'accounts/omniauth_callbacks#sign_up_validation'

  # authenticated :account do
  #   root 'home#new' # , as: :authenticated_root
  # end

  # unauthenticated :account do
  root to: 'public#index' # , as: :unauthenticated_root
  # end
end
