# frozen_string_literal: true

require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  def setup
    @account = accounts(:one)
  end

  test 'should prompt for login' do
    get new_account_session_url
    assert_response :success
  end

  # FALLA TEST
  test 'should login' do
    post account_session_url, params: { email: @account.email, password: 'secret' }
    # puts session
    assert_response :success
    # assert_equal @account.id, account[:id]
    assert_redirected_to root_url
  end

  # FALLA TEST
  test 'should fail login' do
    post account_session_url, params: { email: @account.email, password: 'wrong' }
    assert_redirected_to new_account_session_url
  end

  # Dice mandar a root pero root manda directo a log in
  test 'should logout' do
    delete destroy_account_session_url
    assert_redirected_to root_url
  end
end
