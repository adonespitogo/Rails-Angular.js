Branch.delete_all

5.times do |i|
  Branch.create(
    id: i,
    name: "default-branch-name-#{i}",
    slug: "default-slug-#{i}",
    address: "default-address-#{i}",
    phone_number: "401 0646",
    working_hour_start: Time.now,
    working_hour_end: Time.now,
    lat: 1,
    lng: 1,
    minimum_order_amount: 50,
    delivery_hour_start: Time.now,
    delivery_hour_end: Time.now,
    meta_keywords: "default-meta-keywords-#{i}",
    meta_description: "default-meta-description-#{i}",
    branch_group_id: 1
  )
end