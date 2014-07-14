class CreateJoinTableMenuCategoriesMenuItems < ActiveRecord::Migration
  def change
    create_join_table :menu_categories, :menu_items do |t|
      # t.index [:menu_category_id, :menu_item_id]
      # t.index [:menu_item_id, :menu_category_id]
    end
  end
end
