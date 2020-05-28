# frozen_string_literal: true

require 'test_helper'

class UserCanCreateAnAccountTest < ActionDispatch::IntegrationTest
  def setup
    @account = accounts(:one)
  end

  test 'should create account' do
    assert_difference('Account.count') do
      post account_registration_url, params: { account: { email: 'otro@example.com', password: 'secret', password_confirmation: 'secret' } }
    end

    # assert_redirected_to users_url # (User.last)
  end
end
