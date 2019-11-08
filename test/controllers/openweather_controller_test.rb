require 'test_helper'

class OpenweatherControllerTest < ActionDispatch::IntegrationTest
  test "should get forecast" do
    get openweather_forecast_url
    assert_response :success
  end

end
