require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get games_index_url
    assert_response :success
  end

  test "should get show" do
    get games_show_url
    assert_response :success
  end

  test "should get new" do
    get games_new_url
    assert_response :success
  end

  test "should get console_list" do
    get games_console_list_url
    assert_response :success
  end

end
