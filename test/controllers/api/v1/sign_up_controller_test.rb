require 'test_helper'

class Api::V1::SignUpControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_sign_up_create_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_sign_up_show_url
    assert_response :success
  end

end
