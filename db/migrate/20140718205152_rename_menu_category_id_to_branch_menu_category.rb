class RenameMenuCategoryIdToBranchMenuCategory < ActiveRecord::Migration
  def change
    rename_column :menu_categories_menu_items, :menu_category_id, :branch_menu_category_id
  end
end
