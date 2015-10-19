require 'test_helper'

class OrderHistoriesControllerTest < ActionController::TestCase
  setup do
    @order_history = order_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_history" do
    assert_difference('OrderHistory.count') do
      post :create, order_history: { order_id: @order_history.order_id }
    end

    assert_redirected_to order_history_path(assigns(:order_history))
  end

  test "should show order_history" do
    get :show, id: @order_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_history
    assert_response :success
  end

  test "should update order_history" do
    patch :update, id: @order_history, order_history: { order_id: @order_history.order_id }
    assert_redirected_to order_history_path(assigns(:order_history))
  end

  test "should destroy order_history" do
    assert_difference('OrderHistory.count', -1) do
      delete :destroy, id: @order_history
    end

    assert_redirected_to order_histories_path
  end
end
