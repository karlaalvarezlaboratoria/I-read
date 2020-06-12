# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :image, ImageUploader

  include SoftDeletable

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :bookshelves
  belongs_to :publisher
  has_many :reviews
  has_many :accounts, -> { distinct }, through: :review

  validates :title, :description, :isbn, presence: true

  validates :length, format: {
    with: /(\d)|\A\z/i,
    message: 'must be a number'
  }
  validates :description, length: { minimum: 20 }

  validates :isbn, format: {
    with: /\d{13}/i,
    message: 'use this format 0000000000000.'
  },
                   uniqueness: true

  validates :release_year, format: {
    with: /(\A[12]\d{3})|\A\z/i,
    message: 'add a valid year'
  }
  enum format_type: %w[Printed Audiobook PDF]
  enum length_type: %w[pages minutes percentage]
  enum genre: %w[Action\ and\ adventure Art Autobiography Alternate\ history Anthology
                 Biography Book\ review Chick\ lit Children\'s Cookbook Comic\ book
                 Coming-of-age Crime Diary Dictionary Drama Encyclopedia Fairytale
                 Fantasy Graphic\ novel Guide Health History Historical\ fiction Horror
                 Journal Math Memoir Mystery Paranormal\ romance Picture\ book
                 Poetry Political\ thriller Prayer Religion,\ spirituality,\ and\ new\ age
                 Romance Review Satire Science Science\ fiction Self\ help Short\ story
                 Suspense Textbook Thriller Travel True\ crime Young\ adult]
end
