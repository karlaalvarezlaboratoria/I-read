# frozen_string_literal: true

module Library
  class BooksController < ApplicationController
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
      # respond_to do |format|
      #   if @book.save
      #     format.html { redirect_to @book, notice: 'Book was successfully add.' }
      #     format.json { render :show, status: :created, location: @book }
      #   else
      #     puts @book.errors.full_messages
      #     format.html { render :new }
      #     format.json { render json: @book.errors, status: :unprocessable_entity }
      #   end
    end

    def edit; end

    private

    def book_params
      params.require(:book).permit(:title, :author, :genre, :publisher, :release_year, :description, :format_type, :length, :lenght_type, :isbn)
    end
  end
end
