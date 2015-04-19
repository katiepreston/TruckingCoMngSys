class CompaniesController < ApplicationController
  before_action :check_existence, only: [:show, :edit, :update, :destroy]
  before_action :check_session
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  private
  
  def check_existence
    if Company.find_by(id: params[:id]).nil?
      redirect_to company_path, notice: "Company does not exist"
    end
  end

  public

  def index
    @companies = Company.where(archived: 0).order(name: :asc)
  end

  def archive
    @companies = Company.where(archived: 1).order(name: :asc)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @company.address = Address.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        if Shipment.where(company_id: @company.id, archived: 0).count > 0 && @company.archived == 1
          @company.archived = 0
          @company.save
          redirect_to @company, notice: 'Could not archive due to active shipments'
          return
        end
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def check_session
      redirect_to(controller: "logins", action: "login") and return if session[:user] == nil
      redirect_to({controller: "logins", action: "landing"}, notice: "You do not have access to that information") if session[:account_type] != EmployeesController::Full
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :archived, address_attributes: [:street_number, :street_name, :city, :state, :zip_code])
    end
end
