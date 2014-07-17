class AddDescriptionToItemOptions < ActiveRecord::Migration
  def change
    add_column :item_options, :description, :text
  end
end
