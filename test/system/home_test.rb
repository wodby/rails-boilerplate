require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "shows the full-stack Rails starter" do
    visit root_url

    assert_selector "h1", text: "Your Rails application is ready."

    fill_in "Your name", with: "Wodby"
    click_on "Say hello"

    assert_text "Hello, Wodby. Hotwire is ready."
  end
end
