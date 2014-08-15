json.(@restaurant, :id, :name, :slug, :description, :meta_keywords, :meta_description,
    :fb_link, :twitter_link, :gplus_link, :instagram_link, :foursquare_link
  )

json.logo @restaurant.logo.url(:original)
