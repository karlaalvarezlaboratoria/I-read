# frozen_string_literal: true

module Library
  class BooksController < ApplicationController
    before_action :find_book, only: %i[edit update destroy]

    def index
      @books = Book.all.order(:title)
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      @book.save

      respond_with :library, @book
    end

    def edit; end

    def update
      @book.update(book_params)
      respond_with :library, @book
    end

    private

    def book_params
      params.require(:book).permit(:title, :author, :genre, :publisher, :release_year, :description, :format_type, :length, :lenght_type, :isbn, :image)
    end

    def find_book
      @book = Book.find(params[:id])
    end
  end
end
