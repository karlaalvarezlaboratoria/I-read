# frozen_string_literal: true

require 'test_helper'

class Library::UserCanAddAuthorsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @account = accounts(:one)
    sign_in @account
    @author = authors(:one)
  end

  test 'should get index' do
    get library_authors_path
    assert_response :success
  end

  test 'should get new' do
    get new_library_book_path
    assert_response :success
  end

  test 'user can add new publiser' do
    assert_difference('Author.count') do
      post library_authors_path,
           params: {
             author: {
               name: Faker::Book.unique.author,
               country: Faker::Address.country,
               born: 1564,
               died: 1616
             }
           }
    end

    # created_publisher = assigns(:publisher)
    follow_redirect!
  end

  test 'should get edit' do
    get edit_library_author_path(@author)
    assert_response :success
  end

  test 'user can update author' do
    # new_name = Faker::Book.title
    assert_changes '@author.reload.name' do
      patch library_author_path(@author),
            params: {
              author: {
                name: Faker::Book.unique.author
              }
            }
    end
    follow_redirect!
    # assert_select 'h5', { text: /#{new_name}/ }
  end
end
