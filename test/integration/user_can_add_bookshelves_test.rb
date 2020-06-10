# frozen_string_literal: true

require 'test_helper'

class UserCanAddBookshelvesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @account = accounts(:one)
    sign_in @account
    @bookshelf = bookshelves(:one)
  end

  test 'should get index' do
    get bookshelves_path
    assert_response :success
  end

  test 'should get new' do
    get new_bookshelf_path
    assert_response :success
  end

  test 'user can add new bookshelf' do
    assert_difference('Bookshelf.count') do
      post bookshelves_path,
           params: {
             bookshelf: {
               name: Faker::Lorem.sentence,
               description: Faker::Lorem.paragraph
             }
           }
    end

    # created_bookshelf = assigns(:bookshelf)
    follow_redirect!
    # assert_select 'h5', { text: /#{created_book.title}/ }
    # assert_select 'p', { text: /#{created_book.description}/ }
    # assert_select 'p', { text: /#{created_book.author}/ }
  end

  test 'should get edit' do
    get edit_bookshelf_path(@bookshelf)
    assert_response :success
  end

  test 'user can update bookshelf' do
    new_name = Faker::Book.title
    assert_changes '@bookshelf.reload.name' do
      patch bookshelf_path(@bookshelf),
            params: {
              bookshelf: {
                name: new_name
              }
            }
    end
    follow_redirect!
  end

  test 'wrong user cant update bookshelf' do
    sign_in accounts(:two)
    new_name = Faker::Book.title
    assert_no_changes '@bookshelf.reload.name' do
      patch bookshelf_path(@bookshelf),
            params: {
              bookshelf: {
                name: new_name
              }
            }
    end
  end
end
