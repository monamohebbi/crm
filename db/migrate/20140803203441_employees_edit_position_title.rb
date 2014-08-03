class EmployeesEditPositionTitle < ActiveRecord::Migration
  def change
    remove_column(:employees, :position_title)
    add_column(:employees, :customer_care, :boolean)
    add_column(:employees, :software_technician, :boolean)
    add_column(:employees, :management, :boolean)
  end
end
