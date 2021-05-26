# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

cloudinary_http = %w[https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996441/Studios-seed/studio10_xvoe7a.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996460/Studios-seed/studio14_tnq9mb.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996460/Studios-seed/studio16_trcwtd.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996459/Studios-seed/studio11_tua6r4.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996460/Studios-seed/studio12_mxyeps.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996460/Studios-seed/studio15_e68eyk.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio2_u1l9fv.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio3_dvqked.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio4_jqhfte.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio1_hs7hww.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996442/Studios-seed/studio8_ml8msg.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996442/Studios-seed/studio7_uglnuo.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996442/Studios-seed/studio6_zxvwoh.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996441/Studios-seed/studio5_xeiehr.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996441/Studios-seed/studio9_dnolba.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996441/Studios-seed/studio10_xvoe7a.jpg]

locations = ["2 Chome-32-5 Nakacho, Meguro City, Tokyo 153-0065", "2 Chome-7-3 Chuocho, Meguro City, Tokyo 152-0001",
"2 Chome-12-6 Chuocho, Meguro City, Tokyo 152-0001", "1 Chome-36-6 Nakacho, Meguro City, Tokyo 153-0065",
"2 Chome-30-7 Chuocho, Meguro City, Tokyo 152-0001", '2 Chome-54-10 Gohongi, Meguro City, Tokyo 153-0053',
'2 Chome-2-1 Takaban, Meguro City, Tokyo 152-0004', '2 Chome-8-21 Takaban, Meguro City, Tokyo 152-0004',
'6 Chome-18-11 Shimomeguro, Meguro City, Tokyo 153-0064', '2 Chome-24-3 Gohongi, Meguro City, Tokyo 153-0053',
'4 Chome-23-19 Meguro, Meguro City, Tokyo 153-0063', '1 Chome-26-11 Nakacho, Meguro City, Tokyo 153-0065',
'1 Chome-15-16 Megurohoncho, Meguro City, Tokyo 152-8799', '2 Chome-19-17 Takaban, Meguro City, Tokyo 152-0004',
'2 Chome-26-7 Chuocho, Meguro City, Tokyo 152-0001', '5 Chome-27-16 Nakameguro, Meguro City, Tokyo 153-8633']

puts "Deleting database..."

Studio.delete_all
User.delete_all


puts "Creating user-owners..."


user = User.new(email: Faker::Internet.email, password: Faker::Internet.password, name: Faker::Name.name)
user.save!

cloudinary_http.each_with_index do |http, idx|
  file = URI.open(cloudinary_http[0])
  studio = Studio.new(name: Faker::Company.name , rate: rand(1000..10000), location: locations[0])
  studio.photos.attach(io: file, filename: 'studio.jpg', content_type: 'image/jpg')
  studio.user = user
  studio.save!
end

puts "Studio created"

puts "Done!"

