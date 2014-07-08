class CreateBranchDeliveryZones < ActiveRecord::Migration
  def change
    create_table :branch_delivery_zones do |t|
      t.integer :branch_id
      t.integer :zone_id
      t.decimal :delivery_charge
      t.string :delivery_charge_type

      t.timestamps
    end
  end
end
