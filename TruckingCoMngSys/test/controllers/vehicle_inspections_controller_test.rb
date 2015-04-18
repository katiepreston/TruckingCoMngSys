require 'test_helper'

class VehicleInspectionsControllerTest < ActionController::TestCase
  setup do
    @vehicle_inspection = vehicle_inspections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_inspections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_inspection" do
    assert_difference('VehicleInspection.count') do
      post :create, vehicle_inspection: {  }
    end

    assert_redirected_to vehicle_inspection_path(assigns(:vehicle_inspection))
  end

  test "should show vehicle_inspection" do
    get :show, id: @vehicle_inspection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle_inspection
    assert_response :success
  end

  test "should update vehicle_inspection" do
    patch :update, id: @vehicle_inspection, vehicle_inspection: {  }
    assert_redirected_to vehicle_inspection_path(assigns(:vehicle_inspection))
  end

  test "should destroy vehicle_inspection" do
    assert_difference('VehicleInspection.count', -1) do
      delete :destroy, id: @vehicle_inspection
    end

    assert_redirected_to vehicle_inspections_path
  end
end
