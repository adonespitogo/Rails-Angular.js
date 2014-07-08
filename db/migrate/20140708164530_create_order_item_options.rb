class CreateOrderItemOptions < ActiveRecord::Migration
  def change
    create_table :order_item_options do |t|
      t.integer :order_item_id
      t.string :name
      t.decimal :unit_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
