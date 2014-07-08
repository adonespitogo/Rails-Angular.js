class CreateJoinTableMenuItemsOptions < ActiveRecord::Migration
  def change
    create_join_table :menu_items, :item_options do |t|
      # t.index [:menu_item_id, :item_option_id]
      # t.index [:item_option_id, :menu_item_id]
    end
  end
end
