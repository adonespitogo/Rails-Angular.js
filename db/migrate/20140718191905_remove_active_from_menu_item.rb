class RemoveActiveFromMenuItem < ActiveRecord::Migration
  def change
    remove_column :menu_items, :active
  end
end
