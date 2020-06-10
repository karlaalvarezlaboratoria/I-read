# frozen_string_literal: true

class Bookshelf < ApplicationRecord
  belongs_to :account
  has_and_belongs_to_many :books
end
