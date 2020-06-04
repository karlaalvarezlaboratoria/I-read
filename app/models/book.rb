# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  include SoftDeletable
  # belongs_to :author

  validates :title, presence: true
  validates :author, presence: true

  enum genre: %w[Action\ and\ adventure Art Autobiography]
  enum format_type: %w[Printed Audiobook PDF]
  enum length_type: %w[pages minutes percentage]

  # Alternate history

  # Anthology

  # Biography

  # Chick lit

  # Book review

  # Children's

  # Cookbook

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
