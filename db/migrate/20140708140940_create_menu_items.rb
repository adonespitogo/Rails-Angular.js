class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :slug
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.boolean :active
      t.string :meta_keywords
      t.string :meta_description

      t.timestamps
    end
  end
end
