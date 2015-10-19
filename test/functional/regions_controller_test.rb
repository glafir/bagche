require 'test_helper'

class RegionsControllerTest < ActionController::TestCase
  setup do
    @region = regions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create region" do
    assert_difference('Regions.count') do
      post :create, region: { area: @region.area, capitalcity_id: @region.capitalcity_id, country_id: @region.country_id, name_eng: @region.name_eng, name_rus: @region.name_rus, population: @region.population }
    end

    assert_redirected_to region_path(assigns(:region))
  end

  test "should show region" do
    get :show, id: @region
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @region
    assert_response :success
  end

  test "should update region" do
    put :update, id: @region, region: { area: @region.area, capitalcity_id: @region.capitalcity_id, country_id: @region.country_id, name_eng: @region.name_eng, name_rus: @region.name_rus, population: @region.population }
    assert_redirected_to region_path(assigns(:region))
  end

  test "should destroy region" do
    assert_difference('Regions.count', -1) do
      delete :destroy, id: @region
    end

    assert_redirected_to regions_index_path
  end
end
