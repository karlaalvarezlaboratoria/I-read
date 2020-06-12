# frozen_string_literal: true

require 'test_helper'

class Library::UserCanCreateReviewTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @account = accounts(:one)
    sign_in @account
    @book = books(:one)
    @review = reviews(:one)
  end

  test 'should get index' do
    get library_book_reviews_path(@book.id)
    assert_response :success
  end

  test 'should get new' do
    get new_library_book_review_path(@book)
    assert_response :success
  end

  test 'user can add new review' do
    assert_difference('Review.count') do
      post library_book_reviews_path(@book),
           params: {
             review: {
               review_comment: Faker::Lorem.paragraph,
               rate: 5
             }
           }
    end

    created_review = assigns(:review)
    follow_redirect!
    assert_select 'p', { text: /#{created_review.review_comment}/ }
    assert_select 'p', { text: /#{created_review.rate}/ }
  end

  test 'should get edit' do
    get edit_library_book_review_path(@book, @review)
    assert_response :success
  end

  test 'user can update review' do
    new_review = 'Nuevo comentario'
    assert_changes '@review.reload.review_comment' do
      patch library_book_review_path(@book, @review),
            params: {
              review: {
                review_comment: new_review
              }
            }
    end
    follow_redirect!
    assert_select 'p', { text: /#{new_review}/ }
  end

  test 'wrong user cant update review' do
    sign_in accounts(:two)
    get edit_library_book_review_path(@book, @review)
    assert_response :missing
  end
end
