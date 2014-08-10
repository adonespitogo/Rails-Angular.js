class ModifyBranchWorkingAndDeliveryHours < ActiveRecord::Migration
  def change
    change_column :branches, :working_hour_start, :string
    change_column :branches, :working_hour_end, :string
    change_column :branches, :delivery_hour_start, :string
    change_column :branches, :delivery_hour_end, :string
  end
end
