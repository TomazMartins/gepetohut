class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  check_authorization

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @restaurant = get_restaurant(employee_params[:restaurant])
    employee_params_restaurant = employee_params
    employee_params_restaurant.delete(:restaurant)
    @employee = @restaurant.employees.new(employee_params_restaurant)

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
    @restaurant = get_restaurant(employee_params[:restaurant])
    employee_params_restaurant = employee_params
    employee_params_restaurant.delete(:restaurant)

    respond_to do |format|
      if @employee.update(employee_params_restaurant)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :cpf, :rg, :phone, :salary, :restaurant_id)
    end

    def get_restaurant(restaurant_name)
      restaurant = nil
      if Restaurant.exists?(name: restaurant_name)
        restaurant = Restaurant.find_by(name: restaurant_name)
      else
        restaurant = Restaurant.create(:name => restaurant_name)
      end
    end
end
