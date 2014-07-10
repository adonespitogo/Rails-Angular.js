class Branch < ActiveRecord::Base
  # relationships
  belongs_to :branch_group
  has_many  :delivery_zones,
            foreign_key: "branch_id",
            class_name: "BranchDeliveryZone"
end
