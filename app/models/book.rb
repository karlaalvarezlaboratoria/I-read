# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  include SoftDeletable
  # belongs_to :author

  validates :title, :author, :description, :isbn, presence: true

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
  enum genre: %w[Action\ and\ adventure Art Autobiography Alternate\ history Anthology Biography Chick\ lit Book\ review Children's Cookbook]

  # Comic book

  # Diary

  # Coming-of-age

  # Dictionary

  # Crime

  # Encyclopedia

  # Drama

  # Guide

  # Fairytale

  # Health

  # Fantasy

  # History

  # Graphic novel

  # Journal

  # Historical fiction

  # Math

  # Horror

  # Memoir

  # Mystery

  # Prayer

  # Paranormal romance

  # Religion, spirituality, and new age

  # Picture book

  # Textbook

  # Poetry

  # Review

  # Political thriller

  # Science

  # Romance

  # Self\ help Satire Travel Science\ fiction True\ crime Short\ story Suspense Thriller Young\ adult)
end
