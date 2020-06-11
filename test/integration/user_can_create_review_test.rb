# frozen_string_literal: true

require 'test_helper'

class UserCanCreateReviewTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @account = accounts(:one)
    sign_in @account
    @book = books(:one)
    @review = reviews(:one)
  end

  test 'should get index' do
    get reviews_path
    assert_response :success
  end

  test 'should get new' do
    get new_review_path
    assert_response :success
  end

  test 'user can add new review' do
    assert_difference('Review.count') do
      post reviews_path,
           params: {
             review: {
               review_comment: Faker::Lorem.paragraph,
               rate: 5,
               book_id: '1'
             }
           }
    end

    # created_review = assigns(:review)
    follow_redirect!
    # assert_select 'td', { text: /#{created_bookshelf.name}/ }
  end

  test 'should get edit' do
    get edit_review_path(@review)
    assert_response :success
  end

  test 'user can update review' do
    new_review = 'Nuevo comentario'
    assert_changes '@review.reload.review_comment' do
      patch review_path(@review),
            params: {
              review: {
                review_comment: new_review
              }
            }
    end
    follow_redirect!
    # assert_select 'td', { text: /#{new_name}/ }
  end

  test 'wrong user cant update review' do
    sign_in accounts(:two)
    get edit_review_path(@review)
    assert_response :missing
  end
end
