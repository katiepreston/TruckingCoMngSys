class RoutineMaintenancesController < ApplicationController
  before_action :set_routine_maintenance, only: [:show, :edit, :update, :destroy]

  # GET /routine_maintenances
  # GET /routine_maintenances.json
  def index
    @routine_maintenances = RoutineMaintenance.all
  end

  # GET /routine_maintenances/1
  # GET /routine_maintenances/1.json
  def show
  end

  # GET /routine_maintenances/new
  def new
    @routine_maintenance = RoutineMaintenance.new
  end

  # GET /routine_maintenances/1/edit
  def edit
  end

  # POST /routine_maintenances
  # POST /routine_maintenances.json
  def create
    @routine_maintenance = RoutineMaintenance.new(routine_maintenance_params)

    respond_to do |format|
      if @routine_maintenance.save
        format.html { redirect_to @routine_maintenance, notice: 'Routine maintenance was successfully created.' }
        format.json { render :show, status: :created, location: @routine_maintenance }
      else
        format.html { render :new }
        format.json { render json: @routine_maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routine_maintenances/1
  # PATCH/PUT /routine_maintenances/1.json
  def update
    respond_to do |format|
      if @routine_maintenance.update(routine_maintenance_params)
        format.html { redirect_to @routine_maintenance, notice: 'Routine maintenance was successfully updated.' }
        format.json { render :show, status: :ok, location: @routine_maintenance }
      else
        format.html { render :edit }
        format.json { render json: @routine_maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routine_maintenances/1
  # DELETE /routine_maintenances/1.json
  def destroy
    @routine_maintenance.destroy
    respond_to do |format|
      format.html { redirect_to routine_maintenances_url, notice: 'Routine maintenance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine_maintenance
      @routine_maintenance = RoutineMaintenance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def routine_maintenance_params
      params[:routine_maintenance]
    end
end
