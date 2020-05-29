# frozen_string_literal: true

# Class
#
class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource_or_scope)
    '/home'
  end
end
