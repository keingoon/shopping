# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name:  "ゆーざー",
             name_kana: "ユーザー",
             email: "user@test.com",
             password:              "password",
             password_confirmation: "password")

99.times do |n|
  name = Faker::Name.name
  name_kana = "ユーザー"
  email = "user-#{n+1}@test.com"
  password = "password"
  User.create!(name: name,
               name_kana: name_kana,
               email: email,
               password: password,
               password_confirmation: password)
end

99.times do |n|
  name = Faker::Name.name
  email = "company-#{n+1}@test.com"
  Company.create!(name: name,
                  email: email)
end
