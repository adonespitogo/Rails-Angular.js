BranchMenuCategory.all.each do |bmc|
  bmc.menu_items.delete_all
  bmc.menu_items.clear
  bmc.delete
end

5.times do |i|
  bmc = BranchMenuCategory.create(
    id: i,
    menu_category_id: i,
    branch_id: i
  )
  50.times do |ii|
    bmc.menu_items << MenuItem.create(
      name: "default menu item name - #{ii*i}",
      slug: "default-menu-item-slug-#{ii*i}",
      description: "default description - #{i}",
      price: ii*i,
      meta_keywords: "meta_keywords-#{ii*i}",
      meta_description: "meta_description-#{ii*i}"
    )
  end
end