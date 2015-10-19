require 'test_helper'

class AphubsControllerTest < ActionController::TestCase
  setup do
    @aphub = aphubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aphubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aphub" do
    assert_difference('Aphub.count') do
      post :create, aphub: { aircomapny_id: @aphub.aircomapny_id, airport_id: @aphub.airport_id }
    end

    assert_redirected_to aphub_path(assigns(:aphub))
  end

  test "should show aphub" do
    get :show, id: @aphub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aphub
    assert_response :success
  end

  test "should update aphub" do
    put :update, id: @aphub, aphub: { aircomapny_id: @aphub.aircomapny_id, airport_id: @aphub.airport_id }
    assert_redirected_to aphub_path(assigns(:aphub))
  end

  test "should destroy aphub" do
    assert_difference('Aphub.count', -1) do
      delete :destroy, id: @aphub
    end

    assert_redirected_to aphubs_path
  end
end
