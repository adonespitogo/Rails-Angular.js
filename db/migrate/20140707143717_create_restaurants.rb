class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :fb_link
      t.string :twitter_link
      t.string :gplus_link
      t.string :instagram_link
      t.string :foursquare_link

      t.timestamps
    end
  end
end
