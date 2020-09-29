require 'test_helper'

class Api::V1::SignInControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_sign_in_create_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_sign_in_show_url
    assert_response :success
  end

end
