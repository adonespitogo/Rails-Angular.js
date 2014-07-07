class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :slug
      t.string :name
      t.string :meta_keywords
      t.string :meta_description

      t.timestamps
    end
  end
end
