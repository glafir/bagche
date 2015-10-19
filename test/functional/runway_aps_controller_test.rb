require 'test_helper'

class RunwayApsControllerTest < ActionController::TestCase
  setup do
    @runway_ap = runway_aps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runway_aps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create runway_ap" do
    assert_difference('RunwayAp.count') do
      post :create, runway_ap: { airport_id: @runway_ap.airport_id, runway_data: @runway_ap.runway_data, runway_elevation: @runway_ap.runway_elevation, runway_length: @runway_ap.runway_length }
    end

    assert_redirected_to runway_ap_path(assigns(:runway_ap))
  end

  test "should show runway_ap" do
    get :show, id: @runway_ap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @runway_ap
    assert_response :success
  end

  test "should update runway_ap" do
    put :update, id: @runway_ap, runway_ap: { airport_id: @runway_ap.airport_id, runway_data: @runway_ap.runway_data, runway_elevation: @runway_ap.runway_elevation, runway_length: @runway_ap.runway_length }
    assert_redirected_to runway_ap_path(assigns(:runway_ap))
  end

  test "should destroy runway_ap" do
    assert_difference('RunwayAp.count', -1) do
      delete :destroy, id: @runway_ap
    end

    assert_redirected_to runway_aps_path
  end
end
