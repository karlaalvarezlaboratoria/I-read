# frozen_string_literal: true

require 'test_helper'

class Library::UserCanAddPublishersTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @account = accounts(:one)
    sign_in @account
    @publisher = publishers(:one)
  end

  test 'should get index' do
    get library_publishers_path
    assert_response :success
  end

  test 'should get new' do
    get new_library_publisher_path
    assert_response :success
  end

  test 'user can add new publiser' do
    assert_difference('Publisher.count') do
      post library_publishers_path,
           params: {
             publisher: {
               name: Faker::Book.unique.publisher,
               country: Faker::Address.country
             }
           }
    end

    # created_publisher = assigns(:publisher)
    follow_redirect!
  end

  test 'should get edit' do
    get edit_library_publisher_path(@publisher)
    assert_response :success
  end

  test 'user can update publisher' do
    # new_name = Faker::Book.title
    assert_changes '@publisher.reload.name' do
      patch library_publisher_path(@publisher),
            params: {
              publisher: {
                name: Faker::Book.unique.publisher
              }
            }
    end
    follow_redirect!
    # assert_select 'h5', { text: /#{new_name}/ }
  end
end
