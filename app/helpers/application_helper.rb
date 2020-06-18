# frozen_string_literal: true

module ApplicationHelper
  def profile
    current_account.username
  end
end
