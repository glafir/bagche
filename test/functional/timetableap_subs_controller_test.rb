require 'test_helper'

class TimetableapSubsControllerTest < ActionController::TestCase
  setup do
    @timetableap_sub = timetableap_subs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timetableap_subs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timetableap_sub" do
    assert_difference('TimetableapSub.count') do
      post :create, timetableap_sub: { aircompany_id: @timetableap_sub.aircompany_id, timetableap_id: @timetableap_sub.timetableap_id }
    end

    assert_redirected_to timetableap_sub_path(assigns(:timetableap_sub))
  end

  test "should show timetableap_sub" do
    get :show, id: @timetableap_sub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timetableap_sub
    assert_response :success
  end

  test "should update timetableap_sub" do
    put :update, id: @timetableap_sub, timetableap_sub: { aircompany_id: @timetableap_sub.aircompany_id, timetableap_id: @timetableap_sub.timetableap_id }
    assert_redirected_to timetableap_sub_path(assigns(:timetableap_sub))
  end

  test "should destroy timetableap_sub" do
    assert_difference('TimetableapSub.count', -1) do
      delete :destroy, id: @timetableap_sub
    end

    assert_redirected_to timetableap_subs_path
  end
end
