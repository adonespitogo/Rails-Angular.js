class BranchGroup < ActiveRecord::Base

  # RELATIONSHIPS
  has_and_belongs_to_many :admins, -> { where role: "resto_admin" },
                          class_name: "User",
                          association_foreign_key: "user_id",
                          join_table: "admins_branch_groups"

  has_many :branches

  has_and_belongs_to_many :menu_categories

  def menu_items
    MenuItem.joins(:menu_categories)
      .joins("LEFT JOIN branches_menu_categories ON menu_categories.id = branches_menu_categories.menu_category_id")
      .joins("LEFT JOIN branches ON branches_menu_categories.branch_id = branches.id")
      .joins("LEFT JOIN branch_groups ON branch_groups.id = branches.branch_group_id")
  end
end
