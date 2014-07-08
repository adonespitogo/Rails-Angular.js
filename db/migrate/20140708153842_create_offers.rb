class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :branch_id
      t.string :rule_type
      t.string :rule_items_ids
      t.decimal :rule_price_reached, precision: 10, scale: 2
      t.decimal :result_amount, precision: 10, scale: 2
      t.decimal :result_percentage
      t.string :result_free_items
      t.integer :result_free_items_limit

      t.timestamps
    end
  end
end
