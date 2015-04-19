class ShipmentsController < ApplicationController
  before_action :check_session
  before_action :check_session_driver, only: [:new, :create, :destroy, :addItem, :lineItemRemove ]
  before_action :check_existence, only: [:show, :edit, :update, :destroy, :poView, :poEdit, :addItem, :lineItemRemove ]
  before_action :check_line_item, only: [ :lineItemRemove ]
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]

  private

  def check_line_item
    if params.has_key?(:id)
      if LineItem.find_by(id: params[:id]).nil?
        redirect_to action: "show", id: params[:sid], notice: "Line item does not exist"
      end
    end
  end

  def check_existence
    if params.has_key?(:id)
      if Shipment.find_by(id: params[:id]).nil?
        redirect_to shipments_path, notice: "Shipment does not exist"
        return
      end
      return
    end        
    if params.has_key?(:sid)
      if Shipment.find_by(id: params[:sid]).nil?
        redirect_to shipments_path, notice: "Shipment does not exist"
        return
      end
    end        
  end

  public

  GrandTotalMax = 99999999.99
  ShippingFactor = 0.2

  # GET /shipments
  # GET /shipments.json
  def index
    if session[:account_type] == EmployeesController::Driver
      @shipments = Shipment.joins(:drivers).where(employees: { id: session[:user]}, archived: 0).order(departed_at: :asc)
    else
      @shipments = Shipment.where(archived: 0).order(departed_at: :asc)
    end
  end

  def outgoing
    if session[:account_type] == EmployeesController::Driver
      @shipments = Shipment.joins(:drivers).where(employees: {id: session[:user]}, is_outgoing: 1, archived: 0).order(departed_at: :asc)
    else
      @shipments = Shipment.where(is_outgoing: 1, archived: 0).order(departed_at: :asc)
    end
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
  end

  # GET /shipments/1/edit
  def edit
  end

  def incoming
    if session[:account_type] == EmployeesController::Driver
      @shipments = Shipment.joins(:drivers).where(employees: {id: session[:user]}, is_outgoing: 0, archived: 0).order(departed_at: :asc)
    else
      @shipments = Shipment.where(is_outgoing: 0, archived: 0).order(departed_at: :asc)
    end
  end 

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = Shipment.new(shipment_params)
    @shipment.purchase_order = PurchaseOrder.new(grand_total: 0, shipping: 0, sub_total: 0)
    @driver = nil
    if !(params[:shipment][:drivers].nil?)
      params[:shipment][:drivers].each do |d|
        @driver = Employee.find_by(id: d.to_i)
        @shipment.drivers << @driver
      end
    end
    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
    if !(params[:shipment][:drivers].nil?)
      @shipment.drivers.delete_all
      params[:shipment][:drivers].each do |d|
        @driver = Employee.find_by(id: d.to_i)
        @shipment.drivers << @driver
      end
    end
    respond_to do |format|
      if @shipment.update(shipment_params)
        if Employee.joins(:shipments).where(shipments: {id: @shipment.id}, archived: 0).count > 0 && @shipment.archived == 1
          @shipment.archived = 0
          @shipment.save
          redirect_to @shipment, notice: "Could not archive due to active drivers"
          return
        elsif Vehicle.find(@shipment.vehicle_id).archived == 0 && @shipment.archived == 1
          @shipment.archived = 0
          @shipment.save
          redirect_to @shipment, notice: "Could not archive due to active drivers"
          return
        end
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def poEdit
    @shipment = Shipment.find_by(id: params[:sid])
    @purchase_order = @shipment.purchase_order
    @line_item = LineItem.new(total_cost: 0.0)
    @line_item.item = Item.new
  end

  def poView
    @shipment = Shipment.find_by(id: params[:sid])
    @purchase_order = @shipment.purchase_order
  end

  def addItem
    @shipment = Shipment.find_by(id: params[:sid])
    @line_item = LineItem.new(line_item_params)
    @line_item.item.unit_cost = 0 if @line_item.item.unit_cost.nil?
    @line_item.quantity = 0 if @line_item.quantity.nil?
    @line_item.total_cost = @line_item.item.unit_cost * @line_item.quantity
    if @shipment.purchase_order.grand_total + (@line_item.total_cost * (1.0 + ShippingFactor)).round(2) > GrandTotalMax
      errors.add(:base, "cannot have a grand total exceeding #{GrandTotalMax}")
      return
    end
    if !(@line_item.save)
      return
    end
    @shipment.purchase_order.line_items << @line_item
    @shipment.purchase_order.sub_total += @line_item.total_cost if @line_item.indicator == "shipped"
    @shipment.purchase_order.shipping += (@line_item.total_cost * ShippingFactor).round(2) if @line_item.indicator == "shipped"
    @shipment.purchase_order.grand_total = @shipment.purchase_order.sub_total + @shipment.purchase_order.shipping
    @shipment.save
    redirect_to action: "poEdit", sid: @shipment.id
  end

  def lineItemRemove
    @purchase_order = Shipment.find_by(id: params[:sid]).purchase_order
    @line_item = LineItem.find_by(id: params[:id])
    @line_item.destroy
    @purchase_order.sub_total = 0.0
    if !(@purchase_order.line_items.nil?)
      @purchase_order.line_items.each do |li|
        @purchase_order.sub_total += li.total_cost
      end
    end
    @purchase_order.shipping = (@purchase_order.sub_total * ShippingFactor).round(2)
    @purchase_order.grand_total = @purchase_order.sub_total + @purchase_order.shipping
    @purchase_order.save
    redirect_to action: "poEdit", sid: params[:sid]
  end

  def incoming_reports
    @overall_cost = 0
    @shipments = Shipment.where(is_outgoing: 0, archived: 0).order(departed_at: :asc)
    @shipments.each do |s|
      @overall_cost += s.purchase_order.grand_total
    end
  end

  def outgoing_reports
    @overall_cost = 0
    @shipments = Shipment.where(is_outgoing: 1, archived: 0).order(departed_at: :asc)
    @shipments.each do |s|
      @overall_cost += s.purchase_order.grand_total
    end
  end

  def archive
    @shipments = Shipment.where(archived: 1).order(departed_at: :asc)
  end


  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    def check_session
      redirect_to(controller: "logins", action: "login") and return if session[:user] == nil
      redirect_to({controller: "logins", action: "landing"}, notice: "You do no have access to that information") and return if session[:account_type] != EmployeesController::Full && session[:account_type] != EmployeesController::Shipping && session[:account_type] != EmployeesController::Driver
    end

    def check_session_driver
      redirect_to({controller: "shipments", action: "index"}, notice: "You do not have permission for this action") if session[:account_type] == EmployeesController::Driver
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:arrived_at, :departed_at, :is_outgoing, :has_arrived, :payment_received, :archived, :vehicle_id, :company_id)
    end

    def line_item_params
      params.require(:line_item).permit(:quantity, :indicator, item_attributes: [:name, :unit_cost])
    end
end
