class BranchMenuCategory < ActiveRecord::Base
  # relationships
  has_and_belongs_to_many :menu_items,
                            class_name: "MenuItem",
                            join_table: "menu_categories_menu_items"
  belongs_to :branch
  belongs_to :menu_category
end
