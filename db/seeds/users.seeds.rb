after :branch_groups do

  User.delete_all

  user = User.new(
    id: 1,
    email: "employee@foodcloud.com",
    password: "12345678",
    password_confirmation: "12345678",
    role: "employee",
    firstname: "Resto",
    lastname: "Employee"
  )
  user.skip_confirmation!
  user.save

  user = User.new(
    id: 2,
    email: "resto.admin@foodcloud.com",
    password: "12345678",
    password_confirmation: "12345678",
    role: "resto_admin",
    firstname: "Resto",
    lastname: "Admin"
  )
  user.skip_confirmation!
  user.save

  # add resto-admin as admin to default branchGroup
  BranchGroup.first.admins.clear
  BranchGroup.first.admins << User.find(2)
end
