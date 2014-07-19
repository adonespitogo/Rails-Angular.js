require 'machinist/active_record'
require 'faker'

Activity.blueprint do
  # Attributes here
end

Branch.blueprint do
  slug {"slug-#{sn}"}
  name {"branch-name-#{sn}"}
  address {"address-#{sn}"}
  phone_number {Faker::PhoneNumber.cell_phone}
end

BranchDeliveryZone.blueprint do

end

BranchMenuCategory.blueprint do
  menu_category {MenuCategory.make!}
  branch {Branch.make!}
end

BranchGroup.blueprint do
  name { "Branch Group Name-#{sn}" }
  slug { "slug-#{sn}" }
  meta_keywords do
    meta_keywords = ""
    3.times { meta_keywords += "meta-keywords-#{sn}," }
    meta_keywords
  end
  meta_description { "meta_description-#{sn}" }
  restaurant { Restaurant.make! }
end

BranchDeliveryZone.blueprint do
  # Attributes here
end

Country.blueprint do
  # Attributes here
end

Cuisine.blueprint do
  # Attributes here
end

GeoZone.blueprint do

end

MenuCategory.blueprint do
  name { "MenuCategory-#{sn}" }
  slug { "slug-#{sn}" }
  meta_keywords do
    meta_keywords = ""
    3.times { meta_keywords += "meta-keywords-#{sn}," }
    meta_keywords
  end
  meta_description { "meta_description-#{sn}" }
end

MenuItem.blueprint do
  # Attributes here
end

GeoZone.blueprint do
  # Attributes here
end

ItemOption.blueprint do
  # Attributes here
end

ItemOptionOption.blueprint do
  # Attributes here
end

Offer.blueprint do
  # Attributes here
end

Order.blueprint do
  # Attributes here
end

OrderItem.blueprint do
  # Attributes here
end

OrderItemOption.blueprint do
  # Attributes here
end

Payment.blueprint do
  # Attributes here
end

User.blueprint(:resto_admin) do
  role      { "resto_admin" }
  email     { Faker::Internet.safe_email }
  username  { "resto_admin#{sn}" }
  password  { "12345678" }
  encrypted_password { "$2a$10$qQ9e9c9rWsQ0RDBq1F2Ske77reWEZJozr7rOPNNoMauVDN2M/HDaW" }
  lastname  { Faker::Name.last_name }
  lastname  { Faker::Name.last_name }
  phone_number { Faker::PhoneNumber.cell_phone }
  address { "#{Faker::Address.street_address}, #{Faker::Address.state}, #{Faker::Address.country}" }
end

UserActivity.blueprint do
  # Attributes here
end


Restaurant.blueprint do
  # Attributes here
end