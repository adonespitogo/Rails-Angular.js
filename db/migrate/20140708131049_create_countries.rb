class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code2
      t.string :code3
      t.string :continent
      t.string :currency
      t.string :timezone

      t.timestamps
    end
  end
end
