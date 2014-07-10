class MenuCategory < ActiveRecord::Base
  # relationships
  has_and_belongs_to_many :branch_groups
  has_and_belongs_to_many :branches

  has_and_belongs_to_many :menu_items,
                            class_name: "MenuItem",
                            join_table: "menu_categories_menu_items"
end
