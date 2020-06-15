# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    word = "%#{params[:keyword]}%"
    books = Book.where('title ILIKE ? OR description ILIKE ?', word, word)
    author = Author.find_by('name ILIKE ?', word)
    @search = author ? books + author.books : books

    respond_with @search
  end
end
