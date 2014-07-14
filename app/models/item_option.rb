class ItemOption < ActiveRecord::Base
  # relationships
  has_and_belongs_to_many :menu_items
  has_many :options, class_name: "ItemOptionOption"
end
