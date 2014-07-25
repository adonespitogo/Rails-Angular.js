class RenameBranchesMenuCategoriesToBranchMenuCategories < ActiveRecord::Migration
  def change
    rename_table :branches_menu_categories, :branche_menu_categories
  end
end
