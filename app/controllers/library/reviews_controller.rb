# frozen_string_literal: true

module Library
  class ReviewsController < ApplicationController
    before_action :authenticate_account!
    before_action :find_review, only: %i[edit update destroy]
    # before_action :user_review, only: %i[edit]

    rescue_from 'ActiveRecord::RecordNotFound' do |exception|
      render html: exception, status: 404
    end

    def index
      @reviews = book.reviews
    end

    def show; end

    def new
      if user_have_review?
        @review = user_review
        redirect_to edit_library_book_review_path(@book, @review)
      else
        @review = book.reviews.build
      end
    end

    def create
      @review = Review.new(review_params)
      @review.account_id = current_account.id
      @review.book_id = book.id

      @review.save

      respond_with :library, book, @review
    end

    def edit; end

    def update
      @review.update(review_params)
      respond_with :library, book, @review
    end

    def user_have_review?
      (current_account.reviews.pluck :book_id).include?(book[:id])
    end
    helper_method :user_have_review?

    private

    def review_params
      params.require(:review).permit(:review_comment, :rate)
    end

    def find_review
      @review = current_account.reviews.find(params[:id])
    end

    def book
      @book = Book.find(params[:book_id])
    end
    helper_method :book

    def user_review
      @review = current_account.reviews.find_by(book_id: book[:id])
    end
  end
end
