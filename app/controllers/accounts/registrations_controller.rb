# frozen_string_literal: true

module Accounts
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_account_update_params, only: [:update]
    before_action :configure_sign_up_params, only: [:create]

    def update
      update_resource(resource, account_update_params)

      respond_with resource, location: profiles_path(current_account)
    end

    protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name username email password avatar])
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username email password])
    end
  end
end
