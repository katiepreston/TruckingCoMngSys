class RoutineInspectionsController < ApplicationController
  before_action :set_routine_inspection, only: [:show, :edit, :update, :destroy]

  # GET /routine_inspections
  # GET /routine_inspections.json
  def index
    @routine_inspections = RoutineInspection.all
  end

  # GET /routine_inspections/1
  # GET /routine_inspections/1.json
  def show
  end

  # GET /routine_inspections/new
  def new
    @routine_inspection = RoutineInspection.new
  end

  # GET /routine_inspections/1/edit
  def edit
  end

  # POST /routine_inspections
  # POST /routine_inspections.json
  def create
    @routine_inspection = RoutineInspection.new(routine_inspection_params)

    respond_to do |format|
      if @routine_inspection.save
        format.html { redirect_to @routine_inspection, notice: 'Routine inspection was successfully created.' }
        format.json { render :show, status: :created, location: @routine_inspection }
      else
        format.html { render :new }
        format.json { render json: @routine_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routine_inspections/1
  # PATCH/PUT /routine_inspections/1.json
  def update
    respond_to do |format|
      if @routine_inspection.update(routine_inspection_params)
        format.html { redirect_to @routine_inspection, notice: 'Routine inspection was successfully updated.' }
        format.json { render :show, status: :ok, location: @routine_inspection }
      else
        format.html { render :edit }
        format.json { render json: @routine_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routine_inspections/1
  # DELETE /routine_inspections/1.json
  def destroy
    @routine_inspection.destroy
    respond_to do |format|
      format.html { redirect_to routine_inspections_url, notice: 'Routine inspection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine_inspection
      @routine_inspection = RoutineInspection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def routine_inspection_params
      params[:routine_inspection]
    end
end
