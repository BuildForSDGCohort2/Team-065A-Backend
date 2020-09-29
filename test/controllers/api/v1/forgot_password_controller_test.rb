require 'test_helper'

class Api::V1::ForgotPasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get api_v1_forgot_password_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_forgot_password_create_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_forgot_password_edit_url
    assert_response :success
  end

end
