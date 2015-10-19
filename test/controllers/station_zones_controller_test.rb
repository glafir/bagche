require 'test_helper'

class StationZonesControllerTest < ActionController::TestCase
  setup do
    @station_zone = station_zones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:station_zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create station_zone" do
    assert_difference('StationZone.count') do
      post :create, station_zone: { station_id: @station_zone.station_id, zone: @station_zone.zone }
    end

    assert_redirected_to station_zone_path(assigns(:station_zone))
  end

  test "should show station_zone" do
    get :show, id: @station_zone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @station_zone
    assert_response :success
  end

  test "should update station_zone" do
    patch :update, id: @station_zone, station_zone: { station_id: @station_zone.station_id, zone: @station_zone.zone }
    assert_redirected_to station_zone_path(assigns(:station_zone))
  end

  test "should destroy station_zone" do
    assert_difference('StationZone.count', -1) do
      delete :destroy, id: @station_zone
    end

    assert_redirected_to station_zones_path
  end
end
