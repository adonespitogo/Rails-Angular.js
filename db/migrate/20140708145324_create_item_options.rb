class CreateItemOptions < ActiveRecord::Migration
  def change
    create_table :item_options do |t|
      t.string :name
      t.string :type
      t.integer :option_limit

      t.timestamps
    end
  end
end
