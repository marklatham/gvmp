require 'test_helper'

class ClippingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clippings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clipping" do
    assert_difference('Clipping.count') do
      post :create, :clipping => { }
    end

    assert_redirected_to clipping_path(assigns(:clipping))
  end

  test "should show clipping" do
    get :show, :id => clippings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => clippings(:one).to_param
    assert_response :success
  end

  test "should update clipping" do
    put :update, :id => clippings(:one).to_param, :clipping => { }
    assert_redirected_to clipping_path(assigns(:clipping))
  end

  test "should destroy clipping" do
    assert_difference('Clipping.count', -1) do
      delete :destroy, :id => clippings(:one).to_param
    end

    assert_redirected_to clippings_path
  end
end
