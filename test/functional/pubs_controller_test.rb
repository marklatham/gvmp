require 'test_helper'

class PubsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pub" do
    assert_difference('Pub.count') do
      post :create, :pub => { }
    end

    assert_redirected_to pub_path(assigns(:pub))
  end

  test "should show pub" do
    get :show, :id => pubs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pubs(:one).id
    assert_response :success
  end

  test "should update pub" do
    put :update, :id => pubs(:one).id, :pub => { }
    assert_redirected_to pub_path(assigns(:pub))
  end

  test "should destroy pub" do
    assert_difference('Pub.count', -1) do
      delete :destroy, :id => pubs(:one).id
    end

    assert_redirected_to pubs_path
  end
end
