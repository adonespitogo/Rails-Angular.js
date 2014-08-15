extends "resto_admin/menu_items/base"
object @item

node(:branches) do
  @item.branches.distinct
end

child(:item_options) do
  attributes :id, :name, :price, :options
end

node(:categories){
  @item.menu_categories.distinct
}