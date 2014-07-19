class MenuItem < ActiveRecord::Base
  # relationships
  has_and_belongs_to_many :item_options

  has_and_belongs_to_many :branch_menu_categories,
                            class_name: "BranchMenuCategory",
                            join_table: "menu_categories_menu_items"
end
