# frozen_string_literal: true

require 'test_helper'

class UserCanCreateAnAccountTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @account = accounts(:one)
  end

  test 'should get new' do
    get new_account_registration_path
    assert_response :success
  end

  test 'should create account' do
    assert_difference('Account.count') do
      post account_registration_path,
           params: {
             account: {
               email: 'otro@example.com',
               password: 'secret',
               password_confirmation: 'secret',
               name: Faker::Name.name,
               username: Faker::Lorem.unique.word
             }
           }
    end

    assert_redirected_to home_path
  end

  test 'should get edit' do
    sign_in @account
    get edit_account_registration_path(@account)
    assert_response :success
  end

  test 'should update account' do
    sign_in @account
    patch account_registration_path(id: @account), params: { email: @account.email, password: @account.encrypted_password, username: 'actual username', name: 'New name' }
    assert_response :success
  end

  test 'should destroy account' do
    sign_in @account
    assert_difference('Account.count', -1) do
      delete account_registration_path(id: @account)
    end
  end
end
