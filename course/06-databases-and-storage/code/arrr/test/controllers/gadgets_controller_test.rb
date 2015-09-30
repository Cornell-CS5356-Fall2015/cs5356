require 'test_helper'

class GadgetsControllerTest < ActionController::TestCase
  setup do
    @gadget = gadgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gadgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gadget" do
    assert_difference('Gadget.count') do
      post :create, gadget: { name: @gadget.name, widget_id: @gadget.widget_id }
    end

    assert_redirected_to gadget_path(assigns(:gadget))
  end

  test "should show gadget" do
    get :show, id: @gadget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gadget
    assert_response :success
  end

  test "should update gadget" do
    patch :update, id: @gadget, gadget: { name: @gadget.name, widget_id: @gadget.widget_id }
    assert_redirected_to gadget_path(assigns(:gadget))
  end

  test "should destroy gadget" do
    assert_difference('Gadget.count', -1) do
      delete :destroy, id: @gadget
    end

    assert_redirected_to gadgets_path
  end
end
