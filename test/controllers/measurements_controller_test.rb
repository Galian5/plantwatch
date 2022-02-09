require 'test_helper'

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get measurements_index_url
    assert_response :success
  end

  test "should get show" do
    get measurements_show_url
    assert_response :success
  end

  test "should get new" do
    get measurements_new_url
    assert_response :success
  end

  test "should get create" do
    get measurements_create_url
    assert_response :success
  end

  test "should get update" do
    get measurements_update_url
    assert_response :success
  end

  test "should get destroy" do
    get measurements_destroy_url
    assert_response :success
  end

end
