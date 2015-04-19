require 'test_helper'

class RoutineInspectionsControllerTest < ActionController::TestCase
  setup do
    @routine_inspection = routine_inspections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routine_inspections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create routine_inspection" do
    assert_difference('RoutineInspection.count') do
      post :create, routine_inspection: {  }
    end

    assert_redirected_to routine_inspection_path(assigns(:routine_inspection))
  end

  test "should show routine_inspection" do
    get :show, id: @routine_inspection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @routine_inspection
    assert_response :success
  end

  test "should update routine_inspection" do
    patch :update, id: @routine_inspection, routine_inspection: {  }
    assert_redirected_to routine_inspection_path(assigns(:routine_inspection))
  end

  test "should destroy routine_inspection" do
    assert_difference('RoutineInspection.count', -1) do
      delete :destroy, id: @routine_inspection
    end

    assert_redirected_to routine_inspections_path
  end
end
