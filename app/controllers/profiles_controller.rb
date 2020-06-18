# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_account!
  before_action :find_account

  def find_account
    @account = Account.friendly.find(params[:id])
  end
end
