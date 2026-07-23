require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "serves the Rails landing page" do
    get root_url

    assert_response :success
    assert_equal "text/html", response.media_type
    assert_select "h1", "Your Rails application is ready."
    assert_select "[data-controller='hello']"
  end

  test "serves the Wodby health endpoint" do
    get health_check_url

    assert_response :success
  end
end
