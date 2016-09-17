require 'test_helper'

class WaitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get waits_index_url
    assert_response :success
  end

  test "should get edit" do
    get waits_edit_url
    assert_response :success
  end

  test "should get new" do
    get waits_new_url
    assert_response :success
  end

end
