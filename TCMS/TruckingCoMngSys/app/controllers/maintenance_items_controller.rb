class MaintenanceItemsController < ApplicationController
  before_action :check_session
  before_action :check_existence, only: [ :create, :update, :edit, :destroy, :show ]
  before_action :set_maintenance_item, only: [:show, :edit, :update, :destroy]

  private

  def check_session
    redirect_to controller: "logins", action: "login" if session[:user] == nil
    redirect_to( {controller: "logins", action: "landing"}, notice: "You do not have access to this information") if session[:account_type] != EmployeesController::Full && session[:account_type] != EmployeesController::Maintenance && session[:account_type] != EmployeesController::Shipping
  end

  def check_existence
    if params.has_key?(:id)
      if MaintenanceItem.find(params[:id]).nil?
        redirect_to( {controller: "maintenance_records", action: "edit", vid: params[:vid]}, notice: "This maintenance item does not exist")
        return
      end
      return
    end
    if params.has_key?(:vid)
      if Vehicle.find(params[:vid]).nil?
        redirect_to( {controller: "vehicles", action: "index"}, notice: "This vehicle does not exist")
        return
      end
      return
    end
  end

  public

  def edit
  end

  def show
  end

  # GET /maintenance_items/new
  def new
  end

  # POST /maintenance_items
  # POST /maintenance_items.json
  def create
    @maintenance_item = MaintenanceItem.new
    if params[:maintenance_type].nil?
      render :new, notice: "Must choose a maintenance type"
    elsif params[:maintenance_type] == "RepairRecord"
     @maintenance_item.maintenance_type = RepairRecord.new(maintenance_type_params)
    elsif params[:maintenance_type] == "RoutineInspection"
     @maintenance_item.maintenance_type = RoutineInspection.new(maintenance_type_params)
    elsif params[:maintenance_type] == "RoutineMaintenance"
     @maintenance_item.maintenance_type = RoutineMaintenance.new(maintenance_type_params)
    end
    if @maintenance_item.maintenance_type.save
      Vehicle.find(params[:vid]).maintenance_record.maintenance_items << @maintenance_item
      Vehicle.find(params[:vid]).save
      redirect_to controller: "maintenance_records", action: "edit", id: Vehicle.find(params[:vid]).maintenance_record.id, vid: params[:vid]
    end
  end

  def update
    if @maintenance_item.maintenance_type.update(maintenance_type_params)
      redirect_to controller: "maintenance_records", action: "edit", id: Vehicle.find(params[:vid]).maintenance_record.id, vid: params[:vid]
    else
      render :edit
    end
  end

  # DELETE /maintenance_items/1
  # DELETE /maintenance_items/1.json
  def destroy
    @maintenance_item.destroy
    respond_to do |format|
      format.html { redirect_to controller: "maintenance_records", action: "edit", id: Vehicle.find_by(id: params[:vid]).maintenance_record.id, vid: params[:vid], notice: 'Maintenance item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_item
      @maintenance_item = MaintenanceItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_type_params
      params.require(:maintenance_item).require(:maintenance_type).permit(:performed_at, :description)
    end
end
