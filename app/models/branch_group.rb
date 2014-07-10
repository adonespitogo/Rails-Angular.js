class BranchGroup < ActiveRecord::Base

  # RELATIONSHIPS
  has_and_belongs_to_many :admins,
                          class_name: "User",
                          association_foreign_key: "user_id",
                          join_table: "admins_branch_groups"
end
