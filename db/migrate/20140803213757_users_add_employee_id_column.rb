class UsersAddEmployeeIdColumn < ActiveRecord::Migration
  def change
    add_column(:users, :employee_id, :integer)
    rename_column(:employees, :employee_name, :name)
  end
end
