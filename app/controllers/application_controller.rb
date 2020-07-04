# frozen_string_literal: true

class ApplicationController < ActionController::Base
  respond_to :html
  responders :flash
  responders :collection

  def after_sign_in_path_for(_resource)
    user_root_path(current_user)
  end
end
