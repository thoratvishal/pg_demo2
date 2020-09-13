require 'test_helper'

class RtosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rtos_index_url
    assert_response :success
  end

  test "should get new" do
    get rtos_new_url
    assert_response :success
  end

  test "should get create" do
    get rtos_create_url
    assert_response :success
  end

  test "should get show" do
    get rtos_show_url
    assert_response :success
  end

  test "should get edit" do
    get rtos_edit_url
    assert_response :success
  end

  test "should get update" do
    get rtos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get rtos_destroy_url
    assert_response :success
  end

end
