require 'test_helper'

class StationTypesControllerTest < ActionController::TestCase
  setup do
    @station_type = station_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:station_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create station_type" do
    assert_difference('StationType.count') do
      post :create, station_type: { typename: @station_type.typename }
    end

    assert_redirected_to station_type_path(assigns(:station_type))
  end

  test "should show station_type" do
    get :show, id: @station_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @station_type
    assert_response :success
  end

  test "should update station_type" do
    patch :update, id: @station_type, station_type: { typename: @station_type.typename }
    assert_redirected_to station_type_path(assigns(:station_type))
  end

  test "should destroy station_type" do
    assert_difference('StationType.count', -1) do
      delete :destroy, id: @station_type
    end

    assert_redirected_to station_types_path
  end
end
