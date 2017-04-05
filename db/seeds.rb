# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'lieu', email: 'lieu1214@gmail.com')
Product.create(name: 'meo day hai au bay', description: 'truyen ngan', price: '50000')
Category.create(name: 'book')
Category.create(name: 'comic')

User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'foobar',
             password_confirmation: 'foobar')

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = 'password'
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
end

User.create!(name: 'Admin21',
             email: 'ngoisaocodon1994@gmail.com',
             password: '123456',
             password_confirmation: '123456',
             admin: true)

User.create!(name:  'Admin11',
             email: 'admin1994@gmail.com',
             password: '123456',
             password_confirmation: '123456',
             admin: true)
