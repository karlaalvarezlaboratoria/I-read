# frozen_string_literal: true

module SoftDeletable
  extend ActiveSupport::Concern

  def soft_delete!
    update_attribute(:deleted_at, Time.current)
  end

  included do
    default_scope -> { where(deleted_at: nil) }
  end
end
