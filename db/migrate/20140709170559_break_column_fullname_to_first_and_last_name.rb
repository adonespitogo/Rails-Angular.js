class BreakColumnFullnameToFirstAndLastName < ActiveRecord::Migration
  def change
    tables = [:users, :orders]
    tables.each do |table|
      change_table table do |t|
        t.remove :full_name
        t.string :firstname
        t.string :lastname
      end
    end
  end
end
