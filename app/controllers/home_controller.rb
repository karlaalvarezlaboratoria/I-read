# frozen_string_literal: true

# Class PublicController
#
class HomeController < ApplicationController
  before_action :authenticate_account! # , only: [:new]
  def new
    render :new
  end
end
