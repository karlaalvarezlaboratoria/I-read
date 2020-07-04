# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_account!
  before_action :find_account

  def find_account
    byebug
    @account = Account.find_by_username(params[:id])
    # @account = Account.find(params[:username])
    # @account = Account.find_by(username: params[:id])
  end
end
