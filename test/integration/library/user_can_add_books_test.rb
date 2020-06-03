# frozen_string_literal: true

require 'test_helper'

class Library::UserCanAddBooksTest < ActionDispatch::IntegrationTest
  # include Devise::Test::IntegrationHelpers

  # def setup
  #   @account = accounts(:one)
  #   sign_in @account
  # end

  test 'should get index' do
    get library_books_path
    assert_response :success
  end

  test 'should get new' do
    get new_library_book_path
    assert_response :success
  end

  test 'user can add new book' do
    assert_difference('Book.count') do
      post library_books_url,
           params: {
             book: {
               title: Faker::Book.title,
               author: Faker::Book.author,
               genre: 'Art',
               publisher: Faker::Book.publisher,
               release_year: '2000',
               description: Faker::Lorem.paragraph,
               format_type: 'Printed',
               length: '25',
               length_type: 'pages',
               isbn: ''
             }
           }
    end

    # created_book = assigns(:book)
    follow_redirect!
  end
end
