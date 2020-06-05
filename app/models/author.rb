# frozen_string_literal: true

class Author < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :born, :died, format: {
    with: /(\A[12]\d{3})|\A\z/i,
    message: 'add a valid year'
  }
end
