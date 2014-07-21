after :branch_groups do

  User.delete_all

  User.create(
    id: 1,
    email: "employee@foodcloud.com",
    password: "12345678",
    password_confirmation: "12345678",
    role: "employee",
    firstname: "Resto",
    lastname: "Employee"
  )

  User.create(
    id: 2,
    email: "resto.admin@foodcloud.com",
    password: "12345678",
    password_confirmation: "12345678",
    role: "resto_admin",
    firstname: "Resto",
    lastname: "Admin"
  )

  # add resto-admin as admin to default branchGroup
  BranchGroup.first.admins.clear
  BranchGroup.first.admins << User.find(2)
end
