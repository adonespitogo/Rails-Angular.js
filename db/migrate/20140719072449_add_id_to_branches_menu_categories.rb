class AddIdToBranchesMenuCategories < ActiveRecord::Migration
  def change
    add_column :branches_menu_categories, :id, :primary_key
  end
end
