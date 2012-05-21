require 'test_helper'

class LacksControllerTest < ActionController::TestCase
  setup do
    @lack = lacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lack" do
    assert_difference('Lack.count') do
      post :create, lack: @lack.attributes
    end

    assert_redirected_to lack_path(assigns(:lack))
  end

  test "should show lack" do
    get :show, id: @lack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lack
    assert_response :success
  end

  test "should update lack" do
    put :update, id: @lack, lack: @lack.attributes
    assert_redirected_to lack_path(assigns(:lack))
  end

  test "should destroy lack" do
    assert_difference('Lack.count', -1) do
      delete :destroy, id: @lack
    end

    assert_redirected_to lacks_path
  end
end
