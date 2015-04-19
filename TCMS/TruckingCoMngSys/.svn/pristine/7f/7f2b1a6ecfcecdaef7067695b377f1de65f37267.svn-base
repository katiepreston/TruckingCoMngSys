require 'test_helper'

class RepairPartsControllerTest < ActionController::TestCase
  setup do
    @repair_part = repair_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repair_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repair_part" do
    assert_difference('RepairPart.count') do
      post :create, repair_part: {  }
    end

    assert_redirected_to repair_part_path(assigns(:repair_part))
  end

  test "should show repair_part" do
    get :show, id: @repair_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repair_part
    assert_response :success
  end

  test "should update repair_part" do
    patch :update, id: @repair_part, repair_part: {  }
    assert_redirected_to repair_part_path(assigns(:repair_part))
  end

  test "should destroy repair_part" do
    assert_difference('RepairPart.count', -1) do
      delete :destroy, id: @repair_part
    end

    assert_redirected_to repair_parts_path
  end
end
