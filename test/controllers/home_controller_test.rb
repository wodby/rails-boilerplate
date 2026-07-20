require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "serves the landing page" do
    get root_url

    assert_response :success
    assert_equal({ "message" => "Hello from Wodby Rails" }, response.parsed_body)
  end

  test "serves the health endpoint" do
    get health_check_url

    assert_response :success
  end
end
