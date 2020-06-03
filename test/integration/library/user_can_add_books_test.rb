# frozen_string_literal: true

require 'test_helper'

class Library::UserCanAddBooksTest < ActionDispatch::IntegrationTest
  # include Devise::Test::IntegrationHelpers

  def setup
    #   @account = accounts(:one)
    #   sign_in @account
    @book = books(:one)
  end

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
      post library_books_path,
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

    created_book = assigns(:book)
    follow_redirect!
    assert_select 'h5', { text: /#{created_book.title}/ }
    assert_select 'p', { text: /#{created_book.description}/ }
    assert_select 'p', { text: /#{created_book.author}/ }
  end

  test 'should get edit' do
    get edit_library_book_path(@book)
    assert_response :success
    # assert_select 'h5', { text: /MyString/ }
  end

  test 'user can update book' do
    new_name = Faker::Book.title
    assert_changes '@book.reload.title' do
      patch library_book_path(@book),
            params: {
              book: {
                title: new_name
              }
            }
    end
    follow_redirect!
    assert_select 'h5', { text: /#{new_name}/ }
  end
end
