# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

cloudinary_http = %w[https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio4_jqhfte.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio1_hs7hww.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996442/Studios-seed/studio8_ml8msg.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996442/Studios-seed/studio7_uglnuo.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996442/Studios-seed/studio6_zxvwoh.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996441/Studios-seed/studio5_xeiehr.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996441/Studios-seed/studio9_dnolba.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996441/Studios-seed/studio10_xvoe7a.jpg]

locations = ['2-12-6 Meguro, Tokyo', '1-36-6 Meguro, Tokyo',
'2-8-21 Meguro, Tokyo', '5-27-16 Meguro, Tokyo',
'6-18-11 Meguro, Tokyo', '2-24-3 Meguro, Tokyo',
'4-23-19 Meguro, Tokyo', '1-26-11 Meguro, Tokyo']

puts "Deleting database..."

Studio.delete_all
User.delete_all


puts "Creating user-owners..."


user = User.new(email: Faker::Internet.email, password: Faker::Internet.password, name: Faker::Name.name)
user.save!

cloudinary_http.each_with_index do |http, idx|
  file = URI.open(http)
  studio = Studio.new(name: Faker::Company.name , rate: rand(1000..10000), location: locations[idx])
  studio.photos.attach(io: file, filename: 'studio.jpg', content_type: 'image/jpg')
  studio.user = user
  studio.save!
end

puts "Studio created"

puts "Done!"

