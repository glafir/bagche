require 'test_helper'

class AircraftCompaniesControllerTest < ActionController::TestCase
  setup do
    @aircraft_company = aircraft_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aircraft_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aircraft_company" do
    assert_difference('AircraftCompany.count') do
      post :create, aircraft_company: { aircraft_company: @aircraft_company.aircraft_company }
    end

    assert_redirected_to aircraft_company_path(assigns(:aircraft_company))
  end

  test "should show aircraft_company" do
    get :show, id: @aircraft_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aircraft_company
    assert_response :success
  end

  test "should update aircraft_company" do
    put :update, id: @aircraft_company, aircraft_company: { aircraft_company: @aircraft_company.aircraft_company }
    assert_redirected_to aircraft_company_path(assigns(:aircraft_company))
  end

  test "should destroy aircraft_company" do
    assert_difference('AircraftCompany.count', -1) do
      delete :destroy, id: @aircraft_company
    end

    assert_redirected_to aircraft_companies_path
  end
end
