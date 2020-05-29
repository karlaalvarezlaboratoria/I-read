# frozen_string_literal: true

module Accounts
  # Class Omniauth
  #
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @account = Account.from_omniauth(request.env['omniauth.auth'])

      if @account.persisted?
        @account.remember_me = true
        sign_in_and_redirect @account, event: :authentication
      else
        session['devise.auth'] = request.env['omniauth.auth']
        render :edit
      end
    end

    def sign_up_validation
      @account = Account.from_omniauth(session['devise.auth'])

      if @account.update(account_params)
        sign_in_and_redirect @account, event: :authentication
      else
        render :edit
      end
    end

    private

    def account_params
      params.require(:account).permit(:email, :username, :name)
    end
  end
end
