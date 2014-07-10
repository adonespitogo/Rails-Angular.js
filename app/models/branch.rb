class Branch < ActiveRecord::Base
  # relationships
  belongs_to :branch_group

  has_many  :delivery_zones,
              foreign_key: "branch_id",
              class_name: "BranchDeliveryZone"

  has_and_belongs_to_many :employees, -> { where role: "employee" },
                            class_name: "User",
                            association_foreign_key: "employee_id",
                            join_table: "branches_employees"

  has_and_belongs_to_many :menu_categories
end
