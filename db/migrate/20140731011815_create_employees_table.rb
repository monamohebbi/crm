class CreateEmployeesTable < ActiveRecord::Migration
  def change
    create_table :employees do |table|
      table.string :employee_name
      table.string :position_title
    end
  end
end
