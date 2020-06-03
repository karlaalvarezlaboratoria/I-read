# frozen_string_literal: true

class ApplicationController < ActionController::Base
  respond_to :html
  responders :flash
  responders :collection

  def after_sign_in_path_for(_resource_or_scope)
    '/home'
  end
end
