class CreateJoinTableBranchGroupsMenuCategories < ActiveRecord::Migration
  def change
    create_join_table :menu_categories, :branch_groups do |t|
      # t.index [:menu_category_id, :branch_group_id]
      # t.index [:branch_group_id, :menu_category_id]
    end
  end
end
