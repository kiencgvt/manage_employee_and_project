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
admin = User.find(1)
50.times do
  description = Faker::Lorem.sentence(word_count: 20)
  admin.employee.projects.create(description: description)
end
