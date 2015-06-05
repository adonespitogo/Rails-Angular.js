after :branch_menu_categories do
  Order.delete_all
  
end