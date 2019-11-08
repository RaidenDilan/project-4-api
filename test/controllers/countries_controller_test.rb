require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get countries" do
    get countires_url
    assert_response :success
  end

end
