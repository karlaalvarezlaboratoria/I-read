# frozen_string_literal: true

require 'test_helper'

class ProfileTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @account = accounts(:one)
    sign_in @account
  end

  test 'user can acces to profile' do
    get profiles_path(@account)
    assert_response :success
  end

  test 'get edit link' do
    get edit_account_registration_path(@account)
    assert_response :success
  end

  test 'user can edit his profile' do
    assert_changes '@account.reload.name' do
      patch account_registration_path(id: @account),
            params: { account: {
              email: @account.email,
              current_password: 'secret',
              username: 'actual username',
              name: 'New name'
            } }
    end
    follow_redirect!
    assert_select 'p', { text: /New name/ }
  end
end
