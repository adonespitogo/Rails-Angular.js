class AddRadiusToBranchDeliveryZone < ActiveRecord::Migration
  def change
    add_column :branch_delivery_zones, :radius, :float
  end
end
