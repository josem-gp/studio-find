# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

cloudinary_http = %w[https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006875/klthiyz26teayoovlpxb2dzhqpbs.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006872/3dspoyxeyw1p1f801ffi2py9b03t.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006869/dnlhxeaojy4n13e5bc1rb0kkdg3w.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006866/ymil6ijh0d3m8uukq78gqh9wf5t8.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006863/lga03ymz4tojk6j24dwfd59icrfm.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006860/cri99sdtn965eryqshqch2ayb5we.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006857/0alc1voqhac57uk1d75qe4xzke7q.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006854/8r5ejv4x1z8l4rxd5tq04z9jc25j.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006823/nxznbbdrbczwbidc2z1sw1twjy95.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006129/jyoa8c66c6poln8ccwjdhup9uywo.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006122/ybmxvkj8g330nacsu31vab1dhw0k.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006127/bluiqe9gacj94k8pcvwwzzhocv9i.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622006124/3mztayh5kr18gahktgqk174opvhj.jpg]

locations = ['2-12-6 Meguro, Tokyo', '1-36-6 Meguro, Tokyo',
'2-8-21 Meguro, Tokyo', '5-27-16 Meguro, Tokyo',
'6-18-11 Meguro, Tokyo', '2-24-3 Meguro, Tokyo',
'4-6-6 Meguro, Tokyo', '1-3-25 Meguro, Tokyo',
'1-11-18 Meguro, Tokyo', '2-4-36 Meguro, Tokyo',
'5-24-53 Meguro, Tokyo', '4-1-1 Meguro, Tokyo',
'5-17-8 Meguro, Tokyo']

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

