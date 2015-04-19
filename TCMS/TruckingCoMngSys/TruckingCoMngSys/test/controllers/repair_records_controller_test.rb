require 'test_helper'

class RepairRecordsControllerTest < ActionController::TestCase
  setup do
    @repair_record = repair_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repair_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repair_record" do
    assert_difference('RepairRecord.count') do
      post :create, repair_record: {  }
    end

    assert_redirected_to repair_record_path(assigns(:repair_record))
  end

  test "should show repair_record" do
    get :show, id: @repair_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repair_record
    assert_response :success
  end

  test "should update repair_record" do
    patch :update, id: @repair_record, repair_record: {  }
    assert_redirected_to repair_record_path(assigns(:repair_record))
  end

  test "should destroy repair_record" do
    assert_difference('RepairRecord.count', -1) do
      delete :destroy, id: @repair_record
    end

    assert_redirected_to repair_records_path
  end
end
