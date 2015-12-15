require 'test_helper'

class SolosControllerTest < ActionController::TestCase
  setup do
    @solo = solos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solo" do
    assert_difference('Solo.count') do
      post :create, solo: {  }
    end

    assert_redirected_to solo_path(assigns(:solo))
  end

  test "should show solo" do
    get :show, id: @solo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solo
    assert_response :success
  end

  test "should update solo" do
    patch :update, id: @solo, solo: {  }
    assert_redirected_to solo_path(assigns(:solo))
  end

  test "should destroy solo" do
    assert_difference('Solo.count', -1) do
      delete :destroy, id: @solo
    end

    assert_redirected_to solos_path
  end
end
