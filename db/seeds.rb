# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

cloudinary_http = %w[https://res.cloudinary.com/dqjzulqyf/image/upload/v1622005017/03s7d0wzreijr8ztbodx7m6ytvfg.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622005020/szcknrej0o4qh5b3jbgq6kc6hvb0.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622005703/od89qzjj2jggo4k0afd19ph3u69s.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622009023/wdxrc8w9du32eofeukjbp969u9t5.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622005700/4u81i8qdj7gl2we88e4ez77l7tdw.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622009028/uqolnnbfq7nzzhzv93nnh9b5qm1g.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622009022/968jt3ni57sh8i4b4h7veu2azfnc.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622005025/mm2fnz4y65rqgkxagef1djz1qm6z.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622009029/jdfm6bzp380pkonrvfwi9lz3z98c.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622005022/5xrhm36wuh6k2iptglwrafkkmsxa.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622009030/c2e8rwyn6vutc1lnfsxp5cl0bzdi.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1622005027/mxx24iz2g3uo1dg9lb3ls3g0kql9.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1622009027/9ob257ylx75twc8fwcv6carir4mq.jpg]

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

