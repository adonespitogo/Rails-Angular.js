class RenameBrancheMenuCategoryTable < ActiveRecord::Migration
  def change
    rename_table :branche_menu_categories, :branch_menu_categories
  end
end
