require 'test_helper'

class MaintenanceRecordsControllerTest < ActionController::TestCase
  setup do
    @maintenance_record = maintenance_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintenance_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintenance_record" do
    assert_difference('MaintenanceRecord.count') do
      post :create, maintenance_record: { vehicle_id: @maintenance_record.vehicle_id, vehicle_type: @maintenance_record.vehicle_type }
    end

    assert_redirected_to maintenance_record_path(assigns(:maintenance_record))
  end

  test "should show maintenance_record" do
    get :show, id: @maintenance_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintenance_record
    assert_response :success
  end

  test "should update maintenance_record" do
    patch :update, id: @maintenance_record, maintenance_record: { vehicle_id: @maintenance_record.vehicle_id, vehicle_type: @maintenance_record.vehicle_type }
    assert_redirected_to maintenance_record_path(assigns(:maintenance_record))
  end

  test "should destroy maintenance_record" do
    assert_difference('MaintenanceRecord.count', -1) do
      delete :destroy, id: @maintenance_record
    end

    assert_redirected_to maintenance_records_path
  end
end
