# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_account!
  before_action :find_review, only: %i[edit update destroy]
  #   before_action :find_book, only: %i[create]

  rescue_from 'ActiveRecord::RecordNotFound' do |exception|
    render html: exception, status: 404
  end

  def index
    @reviews = Review.all # .order(:title)
  end

  def show; end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.account_id = current_account.id
    @review.save

    respond_with @review
  end

  def edit; end

  def update
    @review.update(review_params)
    respond_with @review
  end

  private

  def review_params
    params.require(:review).permit(:review_comment, :rate, :book_id)
  end

  def find_review
    @review = current_account.reviews.find(params[:id])
  end

  #   def find_book
  #     @book = Book.find(params[:id])
  #   end
end
