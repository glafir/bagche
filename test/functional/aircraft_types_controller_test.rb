require 'test_helper'

class AircraftTypesControllerTest < ActionController::TestCase
  setup do
    @aircraft_type = aircraft_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aircraft_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aircraft_type" do
    assert_difference('AircraftType.count') do
      post :create, aircraft_type: { type: @aircraft_type.type }
    end

    assert_redirected_to aircraft_type_path(assigns(:aircraft_type))
  end

  test "should show aircraft_type" do
    get :show, id: @aircraft_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aircraft_type
    assert_response :success
  end

  test "should update aircraft_type" do
    put :update, id: @aircraft_type, aircraft_type: { type: @aircraft_type.type }
    assert_redirected_to aircraft_type_path(assigns(:aircraft_type))
  end

  test "should destroy aircraft_type" do
    assert_difference('AircraftType.count', -1) do
      delete :destroy, id: @aircraft_type
    end

    assert_redirected_to aircraft_types_path
  end
end
