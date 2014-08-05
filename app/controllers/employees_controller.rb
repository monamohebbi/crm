class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!
  
  def new
    @employee = Employee.new
  end
  
  def create
    Employee.create(params["employee"].permit(:name, :customer_care, :software_technician, :management))
    redirect_to employees_path
  end
  
  def index
    @employees=Employee.all
  end
  
  def update
    @employee=Employee.find(params["id"])
    @employee.update_attributes(params["employee"].permit(:customer_care, :software_technician, :management))
      redirect_to employees_path
  end
  
  def destroy
    Employee.find(params["id"]).destroy
    redirect_to employees_path
  end
  
end
