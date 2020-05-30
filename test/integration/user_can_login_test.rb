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

  test 'should login' do
    post account_session_url, params: { email: @account.email, password: 'secret' }
    assert_response :success
  end

  test 'should fail login' do
    post account_session_url, params: { email: @account.email, password: 'wrong' }
    assert_match(/Invalid Email or password./, flash[:alert])
  end

  test 'should logout' do
    delete destroy_account_session_url
    assert_redirected_to root_url
  end
end
