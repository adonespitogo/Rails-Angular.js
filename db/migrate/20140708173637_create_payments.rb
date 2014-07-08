class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :reference
      t.string :currency
      t.integer :order_id
      t.decimal :amount, precision: 10, scale: 2
      t.string :method

      t.timestamps
    end
  end
end
