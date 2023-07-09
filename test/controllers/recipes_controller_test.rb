require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get recipes_home_url
    assert_response :success
  end
end
