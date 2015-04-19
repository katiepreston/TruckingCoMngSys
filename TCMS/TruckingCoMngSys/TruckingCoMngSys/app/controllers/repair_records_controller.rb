class RepairRecordsController < ApplicationController
  before_action :set_repair_record, only: [:show, :edit, :update, :destroy]

  # GET /repair_records
  # GET /repair_records.json
  def index
    @repair_records = RepairRecord.all
  end

  # GET /repair_records/1
  # GET /repair_records/1.json
  def show
  end

  # GET /repair_records/new
  def new
    @repair_record = RepairRecord.new
  end

  # GET /repair_records/1/edit
  def edit
  end

  # POST /repair_records
  # POST /repair_records.json
  def create
    @repair_record = RepairRecord.new(repair_record_params)

    respond_to do |format|
      if @repair_record.save
        format.html { redirect_to @repair_record, notice: 'Repair record was successfully created.' }
        format.json { render :show, status: :created, location: @repair_record }
      else
        format.html { render :new }
        format.json { render json: @repair_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_records/1
  # PATCH/PUT /repair_records/1.json
  def update
    respond_to do |format|
      if @repair_record.update(repair_record_params)
        format.html { redirect_to @repair_record, notice: 'Repair record was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_record }
      else
        format.html { render :edit }
        format.json { render json: @repair_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_records/1
  # DELETE /repair_records/1.json
  def destroy
    @repair_record.destroy
    respond_to do |format|
      format.html { redirect_to repair_records_url, notice: 'Repair record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_record
      @repair_record = RepairRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_record_params
      params.permit(:performed_at, :description)
    end
end
