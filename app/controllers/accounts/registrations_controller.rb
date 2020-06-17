# frozen_string_literal: true

module Accounts
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_account_update_params, only: [:update]

    def update
      update_resource(resource, account_update_params)
      respond_with resource, location: profiles_path(current_account)
    end

    protected

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name username email password avatar])
    end
  end
end
