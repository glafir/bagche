require 'test_helper'

class FlightTypesControllerTest < ActionController::TestCase
  setup do
    @flight_type = flight_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flight_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight_type" do
    assert_difference('FlightType.count') do
      post :create, flight_type: { flight_type: @flight_type.flight_type }
    end

    assert_redirected_to flight_type_path(assigns(:flight_type))
  end

  test "should show flight_type" do
    get :show, id: @flight_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight_type
    assert_response :success
  end

  test "should update flight_type" do
    put :update, id: @flight_type, flight_type: { flight_type: @flight_type.flight_type }
    assert_redirected_to flight_type_path(assigns(:flight_type))
  end

  test "should destroy flight_type" do
    assert_difference('FlightType.count', -1) do
      delete :destroy, id: @flight_type
    end

    assert_redirected_to flight_types_path
  end
end
