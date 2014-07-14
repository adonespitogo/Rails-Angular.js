class CreateJoinTableBranchesMenuCategories < ActiveRecord::Migration
  def change
    create_join_table :branches, :menu_categories do |t|
      # t.index [:menu_category_id, :branch_id]
      # t.index [:branch_id, :menu_category_id]
    end
  end
end
