class AddTimestampsToBranchMenuCategory < ActiveRecord::Migration
  def change
    add_column :branch_menu_categories, :created_at, :datetime
    add_column :branch_menu_categories, :udpated_at, :datetime
  end
end
