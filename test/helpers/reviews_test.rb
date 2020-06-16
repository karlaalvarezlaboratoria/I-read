# frozen_string_literal: true

require 'test_helper'

class Reviews < ActionView::TestCase
  test 'valid average input' do
    input = 5.333
    assert_equal 5.3, average(input)
  end

  test 'input with nil value' do
    input = nil
    assert_equal 'N/A', average(input)
  end
end
