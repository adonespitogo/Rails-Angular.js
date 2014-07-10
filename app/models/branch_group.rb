class BranchGroup < ActiveRecord::Base

  # RELATIONSHIPS
  has_and_belongs_to_many :admins, -> { where role: "resto_admin" },
                          class_name: "User",
                          association_foreign_key: "user_id",
                          join_table: "admins_branch_groups"

  has_many :branches

  has_and_belongs_to_many :menu_categories
end
