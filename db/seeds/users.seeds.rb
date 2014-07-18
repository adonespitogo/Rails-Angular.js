User.delete_all
User.create(
  email: "employee@foodcloud.com",
  password: "12345678",
  password_confirmation: "12345678",
  # encrypted_password: "$2a$10$qQ9e9c9rWsQ0RDBq1F2Ske77reWEZJozr7rOPNNoMauVDN2M/HDaW",
  role: "employee",
  firstname: "Resto",
  lastname: "Employee"
)

User.create(
  email: "resto.admin@foodcloud.com",
  password: "12345678",
  password_confirmation: "12345678",
  # encrypted_password: "$2a$10$qQ9e9c9rWsQ0RDBq1F2Ske77reWEZJozr7rOPNNoMauVDN2M/HDaW",
  role: "resto_admin",
  firstname: "Resto",
  lastname: "Admin"
)