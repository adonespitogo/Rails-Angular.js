class BranchGroup < ActiveRecord::Base

  # RELATIONSHIPS
  has_and_belongs_to_many :admins, -> { where role: "resto_admin" },
                          class_name: "User",
                          association_foreign_key: "user_id",
                          join_table: "admins_branch_groups"

  has_many :branches
  belongs_to :restaurant
  has_and_belongs_to_many :menu_categories

  # custom methods
  def menu_items
    MenuItem.uniq.joins("LEFT JOIN menu_categories_menu_items ON menu_items.id = menu_categories_menu_items.menu_item_id")
      .joins("LEFT JOIN branch_menu_categories ON menu_categories_menu_items.branch_menu_category_id = branch_menu_categories.id")
      .joins("LEFT JOIN branches ON branch_menu_categories.branch_id = branches.id")
      .joins("LEFT JOIN branch_groups ON branch_groups.id = branches.branch_group_id")
      .where("branch_groups.id = ?", self.id)
  end

  def menu_items_by_category(category_id)
    ## include items under a branch_group category
    # menu_items.joins("LEFT JOIN branch_groups_menu_categories ON branch_groups_menu_categories.branch_group_id = branch_groups.id")
    #           .joins("LEFT JOIN menu_categories ON menu_categories.id = branch_groups_menu_categories.menu_category_id")
    #           .where("menu_categories.id = ?", category_id)

    ## include items in all branches' categories
    menu_items.where("branch_menu_categories.menu_category_id = ?", category_id)
  end

  def branches_categories
    MenuCategory.joins("LEFT JOIN branch_menu_categories ON branch_menu_categories.menu_category_id = menu_categories.id")
                .joins("LEFT JOIN branches ON branch_menu_categories.branch_id = branches.id")
                .joins("LEFT JOIN branch_groups ON branch_groups.id = branches.branch_group_id")
                .where("branch_groups.id = ?", self.id)
  end
end
