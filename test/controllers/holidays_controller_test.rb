require 'test_helper'

class HolidaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @holiday = holidays(:one)
  end

  test "should get index" do
    get holidays_url, as: :json
    assert_response :success
  end

  test "should create holiday" do
    assert_difference('Holiday.count') do
      post holidays_url, params: { holiday: { attractions: @holiday.attractions, image: @holiday.image, description: @holiday.description, location: @holiday.location, nearest_airport: @holiday.nearest_airport, user_id: @holiday.user_id, when_to_go: @holiday.when_to_go } }, as: :json
    end

    assert_response 201
  end

  test "should show holiday" do
    get holiday_url(@holiday), as: :json
    assert_response :success
  end

  test "should update holiday" do
    patch holiday_url(@holiday), params: { holiday: { attractions: @holiday.attractions, location: @holiday.location, nearest_airport: @holiday.nearest_airport, user_id: @holiday.user_id, when_to_go: @holiday.when_to_go } }, as: :json
    assert_response 200
  end

  test "should destroy holiday" do
    assert_difference('Holiday.count', -1) do
      delete holiday_url(@holiday), as: :json
    end

    assert_response 204
  end
end
