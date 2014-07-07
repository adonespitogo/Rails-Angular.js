class CreateJoinTableCuisinesRestaurants < ActiveRecord::Migration
  def change
    create_join_table :cuisines, :restaurants do |t|
      t.index [:cuisine_id, :restaurant_id]
      t.index [:restaurant_id, :cuisine_id]
    end
  end
end
