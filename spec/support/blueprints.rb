require 'machinist/active_record'
require 'faker'

BranchDeliveryZone.blueprint do

end

GeoZone.blueprint do

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