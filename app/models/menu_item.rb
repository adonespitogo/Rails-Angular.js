class MenuItem < ActiveRecord::Base
  # relationships
  has_and_belongs_to_many :menu_categories,
                            class_name: "MenuCategory",
                            join_table: "menu_categories_menu_items"

  has_and_belongs_to_many :item_options
end
