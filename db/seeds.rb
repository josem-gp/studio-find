# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

cloudinary_http_lena = %w[https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996460/Studios-seed/studio13_m17zno.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996460/Studios-seed/studio14_tnq9mb.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996460/Studios-seed/studio16_trcwtd.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996460/Studios-seed/studio12_mxyeps.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996460/Studios-seed/studio15_e68eyk.jpg]


cloudinary_http_kenn = %w[https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996459/Studios-seed/studio11_tua6r4.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio2_u1l9fv.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio1_hs7hww.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio3_dvqked.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996450/Studios-seed/studio4_jqhfte.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996442/Studios-seed/studio8_ml8msg.jpg https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996442/Studios-seed/studio7_uglnuo.jpg
https://res.cloudinary.com/dqjzulqyf/image/upload/v1621996442/Studios-seed/studio6_zxvwoh.jpg]

name_lena = %w[Metropolis\ Studio Aqua\ Studio Page\ Studio Studio\ Reflect Covert\ Studio]

name_kenn = %w[Here\ Studio Podium\ Studio Nets\ Studio Analog\ Studio Exeter\ Studio Crane\ Studio Studio\ Merge Studio\ Laurel]

locations_lena = ['2-12-6 Meguro, Tokyo', '1-36-6 Meguro, Tokyo',
                  '2-8-21 Meguro, Tokyo', '5-27-16 Meguro, Tokyo',
                  '6-18-11 Meguro, Tokyo']

locations_kenn = ['2-24-3 Meguro, Tokyo',
                  '4-6-6 Meguro, Tokyo', '1-3-25 Meguro, Tokyo',
                  '1-11-18 Meguro, Tokyo', '2-4-36 Meguro, Tokyo',
                  '5-24-53 Meguro, Tokyo', '4-1-1 Meguro, Tokyo',
                  '5-17-8 Meguro, Tokyo']

description = "Centrally located in Meguro. 5 min walk from the station. Spacious studio with newly installed speaker system. Suitable for dancers, yoga, martial arts, etc. Food and drinks allowed. No alcohol."

puts "Deleting database..."
Booking.delete_all
Studio.delete_all
User.delete_all


puts "Creating owner (Lena)..."

user = User.new(email: 'lenatheboss@hotmail.com', password: '1234567', name: 'lena')
user.save!

cloudinary_http_lena.each_with_index do |http, idx|
  file = URI.open(http)
  studio = Studio.new(name: name_lena[idx], rate: rand(800..3000), location: locations_lena[idx], capacity: rand(5..20), area: rand(20..60), description: description)
  studio.photos.attach(io: file, filename: 'studio.jpg', content_type: 'image/jpg')
  studio.user = user
  studio.save!
end

puts "Created!"

puts "Creating owner (Kenn)..."

user = User.new(email: 'kenntheboss@hotmail.com', password: '1234567', name: 'kenn')
user.save!

cloudinary_http_kenn.each_with_index do |http, idx|
  file = URI.open(http)
  studio = Studio.new(name: name_kenn[idx], rate: rand(800..3000), location: locations_kenn[idx], capacity: rand(5..20), area: rand(20..60), description: description)
  studio.photos.attach(io: file, filename: 'studio.jpg', content_type: 'image/jpg')
  studio.user = user
  studio.save!
end

user = User.new(email: 'jose@hotmail.com', password: '1234567', name: 'jose')
user.save!

user = User.new(email: 'allan@hotmail.com', password: '1234567', name: 'allan')
user.save!


puts "Created!"

puts "Done!"
