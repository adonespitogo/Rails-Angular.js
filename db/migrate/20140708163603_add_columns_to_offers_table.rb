class AddColumnsToOffersTable < ActiveRecord::Migration
  def change
    add_column :offers, :status, :string
    add_column :offers, :expiry_date, :datetime
    add_column :offers, :token, :string
    add_column :offers, :published, :string
  end
end
