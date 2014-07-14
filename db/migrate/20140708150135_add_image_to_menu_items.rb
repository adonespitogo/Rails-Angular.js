class AddImageToMenuItems < ActiveRecord::Migration
  def up
    add_attachment :menu_items, :image
  end
  def down
    remove_attachment :menu_items, :image
  end
end
