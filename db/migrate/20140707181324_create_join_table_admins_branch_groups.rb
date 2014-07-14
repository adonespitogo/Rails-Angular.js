class CreateJoinTableAdminsBranchGroups < ActiveRecord::Migration
  def change
    create_join_table :users, :branch_groups, table_name: :admins_branch_groups do |t|
      t.index :user_id
      t.index :branch_group_id
    end
  end
end
