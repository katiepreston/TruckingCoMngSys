class VehiclesController < ApplicationController
  before_action :check_session
  before_action :check_existence, only: [:show, :edit, :update, :destroy]
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  private

  def check_session
    redirect_to controller: "logins", action: "login" and return if session[:user].nil?
    redirect_to({controller: "logins", action: "landing"}, notice: "You do not have access to that information") if session[:account_type] != EmployeesController::Full && session[:account_type] != EmployeesController::Maintenance && session[:account_type] != EmployeesController::Shipping
  end

  def check_existence
    if params.has_key?(:id)
      if Vehicle.find(params[:id]).nil?
        redirect_to({action: "index"}, notice: "This vehicle does not exist")
        return
      end
    end
  end

  public

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.where(archived: 0)
  end

  def archive
    @vehicles = Vehicle.where(archived: 1)
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.maintenance_record = MaintenanceRecord.new

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        if Shipment.where(vehicle_id: @vehicle.id, archived: 0).count > 0
          @vehicle.archived = 0
          @vehicle.save
          redirect_to @vehicle, notice: 'Could not archive due to active assignments'
          return
        end
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def maintenanceReports
    @seek_month_start = DateTime.new(params[:year].to_i, params[:month].to_i, 1, 0, 0, 0)
    @seek_month_end = DateTime.new(params[:year].to_i, (params[:month].to_i + 1) % 13 + 1, 1, 0, 0, 0)
    @maintenance_items = []
    MaintenanceItem.all.each do |mi|
      @maintenance_items << mi if mi.maintenance_type.performed_at < @seek_month_end && (mi.maintenance_type.performed_at > @seek_month_start)
    end
  end

  def maintenanceReportsSetup
  end

  def veh_maint_report
    @overall_cost = 0
    @maintenance_items = Vehicle.find(params[:veh_id]).maintenance_record.maintenance_items
    @maintenance_types = []
    @maintenance_items.each do |mi|
      @maintenance_types << mi.maintenance_type
    end
    @maintenance_types = @maintenance_types.sort { |a,b| a.performed_at <=> b.performed_at }
    @maintenance_items = []
    @maintenance_types.each do |mt|
      @maintenance_items << mt.maintenance_item
      @overall_cost += mt.parts.sum("total_cost") if mt.respond_to?("parts")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:brand, :year, :vehicle_model, :vehicle_type)
    end
end
