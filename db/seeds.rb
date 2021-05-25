# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Deleting database..."

User.delete_all
Studio.delete_all

puts "Creating user-owners..."

25.times do
user = User.new(email: Faker::Internet.email, password: Faker::Internet.password, name: Faker::Name.name)
user.save!
puts "Users created"
studio = Studio.new(name: Faker::Company.name , rate: rand(30..200), location: Faker::Address.city)
studio.user = user
studio.save!

puts "Studio created"
end

puts "Creating users..."

25.times do
user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password, name: Faker::Name.name)
end

puts "Done!"

