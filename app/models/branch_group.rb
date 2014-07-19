class BranchGroup < ActiveRecord::Base

  # RELATIONSHIPS
  has_and_belongs_to_many :admins, -> { where role: "resto_admin" },
                          class_name: "User",
                          association_foreign_key: "user_id",
                          join_table: "admins_branch_groups"

  has_many :branches

  has_and_belongs_to_many :menu_categories

  def menu_items
    MenuItem.joins("LEFT JOIN menu_categories_menu_items ON menu_items.id = menu_categories_menu_items.menu_item_id")
      .joins("LEFT JOIN branch_menu_categories ON menu_categories_menu_items.branch_menu_category_id = branch_menu_categories.id")
      .joins("LEFT JOIN branches ON branch_menu_categories.branch_id = branches.id")
      .joins("LEFT JOIN branch_groups ON branch_groups.id = branches.branch_group_id")
      .where("branch_groups.id = ?", self.id)
  end
end
