class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.string :slug
      t.string :name
      t.string :meta_keywords
      t.string :meta_description

      t.timestamps
    end
  end
end
