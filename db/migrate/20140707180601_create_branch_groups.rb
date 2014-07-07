class CreateBranchGroups < ActiveRecord::Migration
  def change
    create_table :branch_groups do |t|
      t.string :name
      t.string :slug
      t.integer :restaurant_id
      t.integer :main_branch_id
      t.integer :country_id
      t.string :fb_link
      t.string :twitter_link
      t.string :gplus_link
      t.string :instagram_link
      t.string :foursquare_link
      t.string :meta_keywords
      t.string :meta_description

      t.timestamps
    end
  end
end
