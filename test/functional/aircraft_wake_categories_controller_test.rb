require 'test_helper'

class AircraftWakeCategoriesControllerTest < ActionController::TestCase
  setup do
    @aircraft_wake_category = aircraft_wake_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aircraft_wake_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aircraft_wake_category" do
    assert_difference('AircraftWakeCategory.count') do
      post :create, aircraft_wake_category: { category: @aircraft_wake_category.category }
    end

    assert_redirected_to aircraft_wake_category_path(assigns(:aircraft_wake_category))
  end

  test "should show aircraft_wake_category" do
    get :show, id: @aircraft_wake_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aircraft_wake_category
    assert_response :success
  end

  test "should update aircraft_wake_category" do
    put :update, id: @aircraft_wake_category, aircraft_wake_category: { category: @aircraft_wake_category.category }
    assert_redirected_to aircraft_wake_category_path(assigns(:aircraft_wake_category))
  end

  test "should destroy aircraft_wake_category" do
    assert_difference('AircraftWakeCategory.count', -1) do
      delete :destroy, id: @aircraft_wake_category
    end

    assert_redirected_to aircraft_wake_categories_path
  end
end
