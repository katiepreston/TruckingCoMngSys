require 'test_helper'

class RoutineMaintenancesControllerTest < ActionController::TestCase
  setup do
    @routine_maintenance = routine_maintenances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routine_maintenances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create routine_maintenance" do
    assert_difference('RoutineMaintenance.count') do
      post :create, routine_maintenance: {  }
    end

    assert_redirected_to routine_maintenance_path(assigns(:routine_maintenance))
  end

  test "should show routine_maintenance" do
    get :show, id: @routine_maintenance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @routine_maintenance
    assert_response :success
  end

  test "should update routine_maintenance" do
    patch :update, id: @routine_maintenance, routine_maintenance: {  }
    assert_redirected_to routine_maintenance_path(assigns(:routine_maintenance))
  end

  test "should destroy routine_maintenance" do
    assert_difference('RoutineMaintenance.count', -1) do
      delete :destroy, id: @routine_maintenance
    end

    assert_redirected_to routine_maintenances_path
  end
end
