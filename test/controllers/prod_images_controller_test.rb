require 'test_helper'

class ProdImagesControllerTest < ActionController::TestCase
  setup do
    @prod_image = prod_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prod_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prod_image" do
    assert_difference('ProdImage.count') do
      post :create, prod_image: { prodimage: @prod_image.prodimage, product_id: @prod_image.product_id }
    end

    assert_redirected_to prod_image_path(assigns(:prod_image))
  end

  test "should show prod_image" do
    get :show, id: @prod_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prod_image
    assert_response :success
  end

  test "should update prod_image" do
    patch :update, id: @prod_image, prod_image: { prodimage: @prod_image.prodimage, product_id: @prod_image.product_id }
    assert_redirected_to prod_image_path(assigns(:prod_image))
  end

  test "should destroy prod_image" do
    assert_difference('ProdImage.count', -1) do
      delete :destroy, id: @prod_image
    end

    assert_redirected_to prod_images_path
  end
end
