class BranchDeliveryZone < ActiveRecord::Base
  # relationships
  belongs_to :branch
  belongs_to :geo_zone, foreign_key: "zone_id"
end
