# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    word = "%#{params[:keyword]}%"
    books = Book.where('title ILIKE ? OR description ILIKE ?', word, word)
    author = Author.find_by('name ILIKE ?', word)
    books_founded = author ? books + author.books : books

    @search = books_founded ? books_founded.uniq : books_founded

    respond_with @search
  end
end
