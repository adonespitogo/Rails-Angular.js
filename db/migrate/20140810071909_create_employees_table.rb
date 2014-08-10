class CreateEmployeesTable < ActiveRecord::Migration
  def up
    add_column :branches_employees, :id, :primary_key
    rename_column :branches_employees, :employee_id, :user_id
    rename_table :branches_employees, :employees
  end

  def down
    rename_table :employees, :branches_employees
    rename_column :employees, :user_id, :employee_id
    remove_column :branches_employees, :id
  end
end
