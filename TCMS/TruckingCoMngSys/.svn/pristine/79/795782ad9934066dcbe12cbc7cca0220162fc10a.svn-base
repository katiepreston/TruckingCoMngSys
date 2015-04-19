class EmployeesController < ApplicationController
  before_action :check_session
  before_action :check_existence, only: [:show, :edit, :update, :destroy ]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  
  private

  def check_existence
    if Employee.find_by(id: params[:id]).nil?
      redirect_to employees_path, notice: "Employee does not exist"
    end
  end

  public

  Full = 1
  Shipping = 2
  Maintenance = 3
  Driver = 4

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.where(archived: 0).order(last_name: :asc)
  end

  def archive
    @employees = Employee.where(archived: 1).order(last_name: :asc)
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.address = Address.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        if Shipment.joins(:drivers).where(archived: 0, employees: {id: @employee.id}).count > 0 && @employee.archived == 1
          @employee.archived = 0
          @employee.save
          redirect_to @employee, notice: "Could not archive due to active assignments"
          return
        end
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /employees/reports
  # GET /employees/reports.json
  def reports
    @seek_month_start = DateTime.new(params[:year].to_i, params[:month].to_i, 1, 0, 0, 0)
    @seek_month_end = DateTime.new(params[:year].to_i, (params[:month].to_i + 1) % 13 + 1, 1, 0, 0, 0)
    @employees = []
    Employee.all.order(last_name: :asc).each do |e|
      @employees << e if e.started_at < @seek_month_end
    end
  end

  def reportSetup
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def check_session
      redirect_to(controller: "logins", action: "login") and return if session[:user] == nil
      redirect_to({controller: "logins", action: "landing"}, notice: "You do not have access to that information") and return if session[:account_type] != Full
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :middle_name, :home_phone, :cell_phone, :username, :password, :pay_rate,
        :started_at, :ended_at, :password_confirmation, :account_type, :archived, address_attributes: [:street_number, :street_name, :city, :state, :zip_code])
    end
end
