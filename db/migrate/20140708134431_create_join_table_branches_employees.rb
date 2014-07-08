class CreateJoinTableBranchesEmployees < ActiveRecord::Migration
  def change
    create_join_table :branches, :employees do |t|
      t.index [:branch_id, :employee_id]
      t.index [:employee_id, :branch_id]
    end
  end
end
