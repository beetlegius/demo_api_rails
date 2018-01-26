# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! name: 'Member', email: 'member@api.com', password: 'member', password_confirmation: 'member', role: 'member'
User.create! name: 'Admin', email: 'admin@api.com', password: 'admin', password_confirmation: 'admin', role: 'admin'
User.create! name: 'Superadmin', email: 'superadmin@api.com', password: 'superadmin', password_confirmation: 'superadmin', role: 'superadmin'

20.times do |i|
  category = Category.create! name: Faker::Name.name

  rand(3..12).times do
    category.products.create! name: Faker::Name.name, price: Faker::Number.number(2)
  end
end
