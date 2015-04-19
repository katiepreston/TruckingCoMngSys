class MaintenanceRecordsController < ApplicationController
  before_action :check_session
  before_action :check_existence, only: [:edit]
  before_action :set_maintenance_record, only: [:edit]

  private

  def check_session
    redirect_to controller: "logins", action: "login" if session[:user] == nil
    redirect_to({controller: "logins", action: "landing"}, notice: "You do not have access to this information") if session[:account_type] != EmployeesController::Full && session[:account_type] != EmployeesController::Maintenance && session[:account_type] != EmployeesController::Shipping
  end

  def check_existence
    if params.has_key?(:id)
      if MaintenanceRecord.find(params[:id]).nil?
        redirect_to( {controller: "vehicles", action: "index"}, notice: "This vehicle does not exist")
        return
      end
      return
    end
    if params.has_key?(:vid)
      if Vehicle.find(params[:vid]).nil?
        redirect_to( {controller: "vehicles", action: "index"}, notice: "This vehicle does not exist")
        return
      end
    end
  end

  public

  # GET /maintenance_records/1/edit
  def edit
    @maintenance_item = MaintenanceItem.new
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_record
      @maintenance_record = MaintenanceRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_record_params
      params.require(:maintenance_record).permit(:vehicle_id, :vehicle_type)
    end
end
