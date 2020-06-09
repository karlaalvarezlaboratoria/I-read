# frozen_string_literal: true

class Publisher < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :books
end
