require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get settings_index_url
    assert_response :success
  end

  test "should get show" do
    get settings_show_url
    assert_response :success
  end

  test "should get new" do
    get settings_new_url
    assert_response :success
  end

  test "should get create" do
    get settings_create_url
    assert_response :success
  end

  test "should get update" do
    get settings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get settings_destroy_url
    assert_response :success
  end

end
