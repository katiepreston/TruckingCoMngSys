require 'test_helper'

class MaintenancePartsControllerTest < ActionController::TestCase
  setup do
    @maintenance_part = maintenance_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintenance_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintenance_part" do
    assert_difference('MaintenancePart.count') do
      post :create, maintenance_part: { quantity: @maintenance_part.quantity, references: @maintenance_part.references, total_cost: @maintenance_part.total_cost }
    end

    assert_redirected_to maintenance_part_path(assigns(:maintenance_part))
  end

  test "should show maintenance_part" do
    get :show, id: @maintenance_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintenance_part
    assert_response :success
  end

  test "should update maintenance_part" do
    patch :update, id: @maintenance_part, maintenance_part: { quantity: @maintenance_part.quantity, references: @maintenance_part.references, total_cost: @maintenance_part.total_cost }
    assert_redirected_to maintenance_part_path(assigns(:maintenance_part))
  end

  test "should destroy maintenance_part" do
    assert_difference('MaintenancePart.count', -1) do
      delete :destroy, id: @maintenance_part
    end

    assert_redirected_to maintenance_parts_path
  end
end
