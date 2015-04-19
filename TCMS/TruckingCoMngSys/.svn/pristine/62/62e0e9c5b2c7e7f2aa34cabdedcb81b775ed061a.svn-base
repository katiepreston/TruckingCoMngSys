class PartsController < ApplicationController
  before_action :check_session
  before_action :check_existence, only: [:edit, :update, :destroy, :create]
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  private

  def check_session
    redirect_to controller: "logins", action: "login" and return if session[:user].nil?
    redirect_to({controller: "logins", action: "landing"}, notice: "You do not have access to that information") if session[:account_type] != EmployeesController::Full && session[:account_type] != EmployeesController::Maintenance && session[:account_type] != EmployeesController::Shipping
  end

  def check_existence
    if params.has_key?(:vid)
      if Vehicle.find(params[:vid]).nil?
        redirect_to({controller: "vehicles", action: "index"}, notice: "That vehicle does not exist")
        return
      end
      return
    end
    if params.has_key?(:mid)
      if Vehicle.find(params[:vid]).nil?
        redirect_to({controller: "vehicles", action: "index"}, notice: "That vehicle does not exist")
        return
      end
      return
    end
    if !(params.has_key?(:v))
      redirect_to({controller: "logins", action: "landing"}, notice: "Invalid parameters")
      return
    end
  end

  public




  # GET /parts
  # GET /parts.json
  def index
    if params[:v] == 0
      @parts = MaintenanceItem.find(params[:mid]).maintenance_type.parts
    else
      @parts = Vehicle.find(params[:vid]).parts
    end
    @part = Part.new
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts
  # POST /parts.json
  def create
    @part = Part.new(part_params)
    if params[:v] == 0
      pu = MaintenanceItem.find(params[:mid])
    else
      pu = Vehicle.find(params[:vid])
    end
      
    if @part.save
      pu.parts << @part
      pu.save
      redirect_to controller: "parts", action: "index", v: params[:v], mid: params[:mid], vid: params[:vid]
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    if @part.update(part_params)
      redirect_to action: "index", mid: params[:mid], vid: params[:vid], v: params[:v], notice: 'Part was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @part.destroy
    redirect_to action: "index", vid: params[:vid], mid: params[:mid], v: params[:v], notice: "Part was successfully destroyed"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:unit_cost, :total_cost, :is_in_stock, :name, :where_from, :quantity)
    end
end
