require 'test_helper'

class SessionCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_customers_new_url
    assert_response :success
  end

  test "should get create" do
    get session_customers_create_url
    assert_response :success
  end

end
