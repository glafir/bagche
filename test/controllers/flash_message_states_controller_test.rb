require 'test_helper'

class FlashMessageStatesControllerTest < ActionController::TestCase
  setup do
    @flash_message_state = flash_message_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flash_message_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flash_message_state" do
    assert_difference('FlashMessageState.count') do
      post :create, flash_message_state: { state: @flash_message_state.state }
    end

    assert_redirected_to flash_message_state_path(assigns(:flash_message_state))
  end

  test "should show flash_message_state" do
    get :show, id: @flash_message_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flash_message_state
    assert_response :success
  end

  test "should update flash_message_state" do
    patch :update, id: @flash_message_state, flash_message_state: { state: @flash_message_state.state }
    assert_redirected_to flash_message_state_path(assigns(:flash_message_state))
  end

  test "should destroy flash_message_state" do
    assert_difference('FlashMessageState.count', -1) do
      delete :destroy, id: @flash_message_state
    end

    assert_redirected_to flash_message_states_path
  end
end
