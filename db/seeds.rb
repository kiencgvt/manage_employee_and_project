# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
6.times do |i|
  Department.create(name: "BU#{i+1}")
end
Role.create([ { name: "Admin" }, { name: "HR" }, { name: "Leader" }, { name: "Employee" } ])
User.create(email: "admin@gmail.com", password: "123456", role_id: 1)
Profile.create(name: "Admin")
Employee.create(profile_id: 1, user_id: 1)

User.create(email: "leader@gmail.com", password: "123456", role_id: 3, department_id: 2)
Profile.create(name: "Kien")
Employee.create(profile_id: 2, user_id: 2)

=begin
User.create(email: "employee@gmail.com", password: "123456", role_id: 4)
Profile.create(name: "Hieu")
Employee.create(profile_id: 3, user_id: 3, department_id: 1)
=end

admin = User.find(2)
50.times do
  description = Faker::Lorem.sentence(word_count: 20)
  admin.employee.projects.create(description: description, department_id: 1)
end
