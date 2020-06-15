# frozen_string_literal: true

require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get search_index_path
    assert_response :success
  end

  test 'user search by title ' do
    get search_index_path, params: { keyword: 'first' }
    assert_select 'p', { text: books(:one).title }
  end

  test 'user search by description ' do
    get search_index_path, params: { keyword: 'veinte' }
    assert_select 'p', { text: books(:one).title }
  end

  test 'user search by author ' do
    get search_index_path, params: { keyword: 'juanjo' }
    assert_select 'p', { text: books(:one).title }
  end

  test 'user not found matches' do
    get search_index_path, params: { keyword: 'batman' }
    assert_select 'h5', 'Not matches found'
  end
end
