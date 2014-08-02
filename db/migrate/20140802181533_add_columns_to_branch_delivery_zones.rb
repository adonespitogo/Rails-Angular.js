class AddColumnsToBranchDeliveryZones < ActiveRecord::Migration
  def change
    remove_column :branch_delivery_zones, :zone_id
    add_column :branch_delivery_zones, :lat, :decimal
    add_column :branch_delivery_zones, :lng, :decimal
    add_column :branch_delivery_zones, :address, :string
    add_column :branch_delivery_zones, :country_id, :integer
  end
end
