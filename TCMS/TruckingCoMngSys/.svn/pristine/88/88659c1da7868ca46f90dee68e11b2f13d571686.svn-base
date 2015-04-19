class RepairPartsController < ApplicationController
  before_action :set_repair_part, only: [:show, :edit, :update, :destroy]

  # GET /repair_parts
  # GET /repair_parts.json
  def index
    @repair_parts = RepairPart.all
  end

  # GET /repair_parts/1
  # GET /repair_parts/1.json
  def show
  end

  # GET /repair_parts/new
  def new
    @repair_part = RepairPart.new
  end

  # GET /repair_parts/1/edit
  def edit
  end

  # POST /repair_parts
  # POST /repair_parts.json
  def create
    @repair_part = RepairPart.new(repair_part_params)

    respond_to do |format|
      if @repair_part.save
        format.html { redirect_to @repair_part, notice: 'Repair part was successfully created.' }
        format.json { render :show, status: :created, location: @repair_part }
      else
        format.html { render :new }
        format.json { render json: @repair_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_parts/1
  # PATCH/PUT /repair_parts/1.json
  def update
    respond_to do |format|
      if @repair_part.update(repair_part_params)
        format.html { redirect_to @repair_part, notice: 'Repair part was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_part }
      else
        format.html { render :edit }
        format.json { render json: @repair_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_parts/1
  # DELETE /repair_parts/1.json
  def destroy
    @repair_part.destroy
    respond_to do |format|
      format.html { redirect_to repair_parts_url, notice: 'Repair part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_part
      @repair_part = RepairPart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_part_params
      params[:repair_part]
    end
end
