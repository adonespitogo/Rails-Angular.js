extends "resto_admin/branches/base"
object @branch

child(:delivery_zones) do
  attributes :id , :delivery_charge, :delivery_charge_type, :radius, :lat, :lng, :address
end