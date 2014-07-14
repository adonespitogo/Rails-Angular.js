class AddBranchGroupIdToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :branch_group_id, :integer
  end
end
