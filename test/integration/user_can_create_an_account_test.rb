# frozen_string_literal: true

require 'test_helper'

class UserCanCreateAnAccountTest < ActionDispatch::IntegrationTest
  def setup
    @account = accounts(:one)
  end

  test 'should get new' do
    get new_account_registration_url
    assert_response :success
  end

  test 'should create account' do
    assert_difference('Account.count') do
      post account_registration_url, params: { account: { email: 'otro@example.com', password: 'secret', password_confirmation: 'secret' } }
    end

    assert_redirected_to root_url # (User.last)
  end

  # ESTE NECESITA LOGIN PREVIO, ES NECESARIO TESTEAR???
  # ES LO MISMO EDIT QUE UPDATE???
  # test 'should get edit' do
  #   get edit_account_registration_url(@account)
  #   assert_response :success
  # end

  test 'should update user' do
    patch account_registration_url(@account), params: { account: { email: @account.email, password: 'otro', password_confirmation: 'otro' } }
    # A DÓNDE VA A REDIRECCIONAR???
    # assert_redirected_to account_url # (@user)
  end

  #ESTE NO ESTÁ PASANDO
  test 'should destroy user' do
    assert_difference('Account.count', -1) do
      delete account_registration_url(@account)
    end
    # A DÓNDE VA A REDIRECCIONAR???
    # assert_redirected_to account_url
  end
end
