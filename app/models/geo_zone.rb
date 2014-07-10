class GeoZone < ActiveRecord::Base
  # relationships
  has_many  :delivery_zones,
            foreign_key: "zone_id",
            class_name: "BranchDeliveryZone"
end
