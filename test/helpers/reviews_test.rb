# frozen_string_literal: true

require_relative '../../app/helpers/reviews_helper'

class Reviews < ActionView::TestCase
  test 'should work' do
    input = 5.333
    assert_equal 5.3, average(input)
  end

  test 'another' do
    input = nil
    assert_equal 'N/A', average(input)
  end
end
