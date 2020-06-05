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

    created_publisher = assigns(:publisher)
    follow_redirect!
    assert_select 'td', { text: /#{created_publisher.name}/ }
    assert_select 'td', { text: /#{created_publisher.country}/ }
  end

  test 'should get edit' do
    get edit_library_publisher_path(@publisher)
    assert_response :success
  end

  test 'user can update publisher' do
    new_name = Faker::Book.unique.publisher
    assert_changes '@publisher.reload.name' do
      patch library_publisher_path(@publisher),
            params: {
              publisher: {
                name: new_name
              }
            }
    end
    follow_redirect!
    assert_select 'td', { text: /#{new_name}/ }
  end
end
