MenuCategory.delete_all

5.times do |i|
  MenuCategory.create(
    id: i,
    name: "default-category-#{i}",
    slug: "default-category-slug-#{i}",
    meta_keywords: "meta_keywords-#{i}",
    meta_description: "meta description-#{i}"
  )
end
