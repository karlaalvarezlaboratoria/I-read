# frozen_string_literal: true

module Library
  class ReviewsController < ApplicationController
    before_action :authenticate_account!
    before_action :find_review, only: %i[edit update destroy]

    rescue_from 'ActiveRecord::RecordNotFound' do |exception|
      render html: exception, status: 404
    end

    def index
      @reviews = book.reviews
    end

    def show; end

    def new
      @review = book.reviews.build
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
  end
end
