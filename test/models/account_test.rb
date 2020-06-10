# frozen_string_literal: true

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'user have 3 bookshelves by default' do
    assert_difference('Bookshelf.count', 3) do
      Account.new(email: 'john@example.com', password: 'secret').save
    end
  end
end
