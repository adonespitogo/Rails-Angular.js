extends "resto_admin/menu_items/base"
object @item

attributes :branches

child(:item_options) do
  attributes :id, :name, :price, :options
end

node(:categories){
  @item.menu_categories
}