require 'test_helper'

class UserThemesControllerTest < ActionController::TestCase
  setup do
    @user_theme = user_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_theme" do
    assert_difference('UserTheme.count') do
      post :create, user_theme: { theme: @user_theme.theme }
    end

    assert_redirected_to user_theme_path(assigns(:user_theme))
  end

  test "should show user_theme" do
    get :show, id: @user_theme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_theme
    assert_response :success
  end

  test "should update user_theme" do
    put :update, id: @user_theme, user_theme: { theme: @user_theme.theme }
    assert_redirected_to user_theme_path(assigns(:user_theme))
  end

  test "should destroy user_theme" do
    assert_difference('UserTheme.count', -1) do
      delete :destroy, id: @user_theme
    end

    assert_redirected_to user_themes_path
  end
end
