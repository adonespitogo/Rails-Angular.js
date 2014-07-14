class CreateItemOptionOptions < ActiveRecord::Migration
  def change
    create_table :item_option_options do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.integer :item_option_id

      t.timestamps
    end
  end
end
