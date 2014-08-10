class Branch < ActiveRecord::Base
  # relationships
  belongs_to :branch_group

  has_many  :delivery_zones,
              foreign_key: "branch_id",
              class_name: "BranchDeliveryZone"

  accepts_nested_attributes_for :delivery_zones

  has_many :employees
  has_many :users, -> { where(role: :employee) },
            through: :employees

  has_and_belongs_to_many :menu_categories
  has_many :orders
  has_many :branch_menu_categories
  has_many :menu_items, through: :branch_menu_categories
end
