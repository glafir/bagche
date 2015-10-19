require 'test_helper'

class FlashMessagesControllerTest < ActionController::TestCase
  setup do
    @flash_message = flash_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flash_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flash_message" do
    assert_difference('FlashMessage.count') do
      post :create, flash_message: { message: @flash_message.message, user_id: @flash_message.user_id }
    end

    assert_redirected_to flash_message_path(assigns(:flash_message))
  end

  test "should show flash_message" do
    get :show, id: @flash_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flash_message
    assert_response :success
  end

  test "should update flash_message" do
    patch :update, id: @flash_message, flash_message: { message: @flash_message.message, user_id: @flash_message.user_id }
    assert_redirected_to flash_message_path(assigns(:flash_message))
  end

  test "should destroy flash_message" do
    assert_difference('FlashMessage.count', -1) do
      delete :destroy, id: @flash_message
    end

    assert_redirected_to flash_messages_path
  end
end
