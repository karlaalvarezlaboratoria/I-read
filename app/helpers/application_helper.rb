# frozen_string_literal: true

module ApplicationHelper
  def profile
    current_account.username || current_account.email
  end

  def avatar; end
end
