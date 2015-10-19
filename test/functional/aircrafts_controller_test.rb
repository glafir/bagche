require 'test_helper'

class AircraftsControllerTest < ActionController::TestCase
  setup do
    @aircraft = aircrafts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aircrafts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aircraft" do
    assert_difference('Aircraft.count') do
      post :create, aircraft: { aircraft_iata_code: @aircraft.aircraft_iata_code, aircraft_icao_code: @aircraft.aircraft_icao_code, aircraft_maxspeed: @aircraft.aircraft_maxspeed, aircraft_model: @aircraft.aircraft_model, aircraft_seats: @aircraft.aircraft_seats, aircraft_type_id: @aircraft.aircraft_type_id, aircraft_wake_category_id: @aircraft.aircraft_wake_category_id, aircraft_webinfo: @aircraft.aircraft_webinfo }
    end

    assert_redirected_to aircraft_path(assigns(:aircraft))
  end

  test "should show aircraft" do
    get :show, id: @aircraft
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aircraft
    assert_response :success
  end

  test "should update aircraft" do
    put :update, id: @aircraft, aircraft: { aircraft_iata_code: @aircraft.aircraft_iata_code, aircraft_icao_code: @aircraft.aircraft_icao_code, aircraft_maxspeed: @aircraft.aircraft_maxspeed, aircraft_model: @aircraft.aircraft_model, aircraft_seats: @aircraft.aircraft_seats, aircraft_type_id: @aircraft.aircraft_type_id, aircraft_wake_category_id: @aircraft.aircraft_wake_category_id, aircraft_webinfo: @aircraft.aircraft_webinfo }
    assert_redirected_to aircraft_path(assigns(:aircraft))
  end

  test "should destroy aircraft" do
    assert_difference('Aircraft.count', -1) do
      delete :destroy, id: @aircraft
    end

    assert_redirected_to aircrafts_path
  end
end
