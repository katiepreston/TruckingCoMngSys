class MaintenancePartsController < ApplicationController
  before_action :set_maintenance_part, only: [:show, :edit, :update, :destroy]

  # GET /maintenance_parts
  # GET /maintenance_parts.json
  def index
    @maintenance_parts = MaintenancePart.all
  end

  # GET /maintenance_parts/1
  # GET /maintenance_parts/1.json
  def show
  end

  # GET /maintenance_parts/new
  def new
    @maintenance_part = MaintenancePart.new
  end

  # GET /maintenance_parts/1/edit
  def edit
  end

  # POST /maintenance_parts
  # POST /maintenance_parts.json
  def create
    @maintenance_part = MaintenancePart.new(maintenance_part_params)

    respond_to do |format|
      if @maintenance_part.save
        format.html { redirect_to @maintenance_part, notice: 'Maintenance part was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_part }
      else
        format.html { render :new }
        format.json { render json: @maintenance_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_parts/1
  # PATCH/PUT /maintenance_parts/1.json
  def update
    respond_to do |format|
      if @maintenance_part.update(maintenance_part_params)
        format.html { redirect_to @maintenance_part, notice: 'Maintenance part was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_part }
      else
        format.html { render :edit }
        format.json { render json: @maintenance_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_parts/1
  # DELETE /maintenance_parts/1.json
  def destroy
    @maintenance_part.destroy
    respond_to do |format|
      format.html { redirect_to maintenance_parts_url, notice: 'Maintenance part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_part
      @maintenance_part = MaintenancePart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_part_params
      params.require(:maintenance_part).permit(:references, :total_cost, :quantity)
    end
end
