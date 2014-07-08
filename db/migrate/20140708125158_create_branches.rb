class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :slug
      t.string :name
      t.string :address
      t.string :phone_number
      t.time :working_hour_start
      t.time :working_hour_end
      t.float :lat
      t.float :lng
      t.decimal :minimum_order_amount, precision: 10, scale: 2
      t.time :delivery_hour_start
      t.time :delivery_hour_end
      t.string :meta_keywords
      t.string :meta_description

      t.timestamps
    end
  end
end
