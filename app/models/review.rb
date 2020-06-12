# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :book
  belongs_to :account

  validates :book_id, uniqueness: { scope: :account_id,
                                    message: 'Este libro solo permite una reseña por usuario' }
end
