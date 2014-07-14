class CreateGeoZones < ActiveRecord::Migration
  def change
    create_table :geo_zones do |t|
      t.float :lat
      t.float :lng
      t.string :address
      t.integer :country_id

      t.timestamps
    end
  end
end
