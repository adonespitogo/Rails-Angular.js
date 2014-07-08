class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :branch_id
      t.decimal :delivery_price
      t.string :delivery_type
      t.string :currency
      t.integer :user_id
      t.string :full_name
      t.string :phone_number
      t.string :delivery_address
      t.string :status
      t.string :ip_address
      t.integer :delivered_by
      t.datetime :accepted_at
      t.integer :accepted_by
      t.datetime :rejected_at
      t.integer :rejected_by

      t.timestamps
    end
  end
end
