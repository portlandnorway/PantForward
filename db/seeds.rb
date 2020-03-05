# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts "Clearing the db..."
Collection.destroy_all
User.destroy_all

puts 'Creating admins...'

1.times do
  user = User.new(
    email: 'dennis.neely22@gmail.com',
    first_name: 'Dennis',
    last_name: 'Neely',
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  file = URI.open('https://res.cloudinary.com/dory4tmkz/image/upload/v1582883124/7LVKrLLR2u2QggMsxbt4Hx91.png')
  user.avatar.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  user.save!
end

1.times do
  user = User.new(
    email: 'nikolai@mangen.no',
    first_name: 'Nikolai',
    last_name: 'Toverud',
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  file = URI.open('https://res.cloudinary.com/dory4tmkz/image/upload/v1582883044/dXAfomAhDQymMuCePBf1DtM7.jpg')
  user.avatar.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  user.save!
end

puts 'Done!'

MALES = ["https://images.unsplash.com/photo-1542909168-6296a31d7689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1546458904-143d1674858d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1578176603894-57973e38890f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1505975410356-cec53a6cdec9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1540574573343-bdd23b70c48b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1517588632672-9758d6acba04?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1578597096845-8854485e8753?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1505247964246-1f0a90443c36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1515175704145-8a06ffce6b77?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1564061170517-d3907caa96ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1562124638-724e13052daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1556541516-6df3db2bc84f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"]

FEMALES = ["https://images.unsplash.com/photo-1517365830460-955ce3ccd263?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1579503841516-e0bd7fca5faa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1485893086445-ed75865251e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1496439786094-e697ca3584d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1530519370550-209c4d0f6577?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1530519486016-6ebc8a343be5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1525735765456-7f67273a9d93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1508767887031-185bbeb45718?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1534945773093-1119ae5684ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1513690277738-c9bc7eb2a992?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1563701039037-37a8ea2e79be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1554114867-3e4ffcba7762?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1553867745-6e038d085e86?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"]

puts "females: #{FEMALES.count}"
puts "males: #{MALES.count}"

male_img = 0
female_img = 0

12
m_first_names = ["Francis", "Kent Ove", "Amund", "Alexander", "Chris", "Per", "Eivind", "Frank", "Gøran", "Jostein", "Ole", "Bjørn"]
m_last_names = ["Johansson-Merric", "Johansen", "Valø", "Asbøll", "Erikssen", "Danielsen", "Halvorsen", "Røe", "Lundstrom", "Johnssen", "Pettersen", "Kvalvågnes"]



13
f_first_names = ["Johanna", "Silje", "Saioa", "Kine", "Ingeborg", "Vigdis", "Stine", "Celine", "Line", "Nora", "Annikken", "Eleanor", "Berit"]

f_last_names = ["Lovén", "Aspelund", "Fulsebakke", "Bakketun", "Mead", "Bakke", "Bergli", "Hofsted", "Frank", "Eli", "Bjordal", "Ramsøy", "Frogner"]

phone_numbers = [95556632, 95557132, 93994456, 93551922, 95553419, 95558826, 95558291, 59555559, 91455965, 91445567, 90304450, 91928878, 91929234]






puts 'Creating 13 fake women...'
13.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: f_first_names.pop,
    last_name: f_last_names.pop,
    phone_number: phone_numbers.sample,
    password: 'password'
  )
  file = URI.open(FEMALES[female_img])
  user.avatar.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  user.save!
  female_img += 1
end

puts 'Creating 12 fake men...'
12.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: m_first_names.pop,
    last_name: m_last_names.pop,
    phone_number: phone_numbers.sample,
    password: 'password'
  )
  file = URI.open(MALES[male_img])
  user.avatar.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  user.save!
  male_img += 1
end

puts 'Finished with the users!'

addresses = ["Kirsten Flagstads Plass 1, Oslo", "Karl Johans gate 11, Oslo, Oslo, Norway", "Landgangen 1, Oslo, Oslo, Norway", "Vulkan 5, 0178 Oslo", "Schweigaards gate 34C, 0191 Oslo", "Trondheimsveien 64, Oslo, Oslo, Norway", "Hagegata 27, Oslo, Oslo, Norway", "Helgesens gate 14, Oslo, Oslo, Norway", "Seilduksgata, Oslo, Oslo, Norway"]

neighborhoods = ["Sentrum", "Sentrum", "Sentrum", "Sentrum", "Gamle Oslo", "Grūnerløkka - Sofienberg", "Gamle Oslo", "Grūnerløkka - Sofienberg", "Grūnerløkka - Sofienberg"]

details = ["I've left the bottles just outside the front gate. Cheers!", "Thanks! The cans are just behind the plant on the front porch. You can't miss it :)", "Thanks! Call me if there are any issues.", "Thanks for your help. I will be at work but just text me if you can't find the bag.", "Hey! Just ring the bell when you get inside. I'll buzz you in to let you grab the bottles. Our company is on the 4th floor!", "Text me if you can't find it.", "Should be easy to find but call me if you have any trouble.", "My apartment can be a bit hard to find, look for the gate next to the red door and just send me a text when you're close.", "Send me a text when you get here!", "Just look for my name and hit the buzzer! I'll come down with the bottles :)"]


TIP = [50, 100, 50, 100, 20, 50, 50, 20]
GLASS = [true, false, false]
puts 'Creating 9 fake collections for Nik...'

users = User.all.to_a
users.shift
users.shift
users

9.times do
  collection = Collection.new(
    address: addresses.pop,
    tip: 50,
    small_bottles: 10,
    big_bottles: 0,
    reward: 50,
    details: details.pop,
    user: users.sample,
    neighborhood: neighborhoods.pop,
    glass: GLASS.sample
  )
  collection.save!
end

puts "Collection for Dennis..."

1.times do
  collection = Collection.new(
    address: "Blindern, Oslo, Oslo, Norway",
    tip: 20,
    small_bottles: 25,
    big_bottles: 10,
    reward: 100,
    details: details.pop,
    user: User.first,
    neighborhood: "St. Hanshaugen - Ullevål",
    glass: false
  )
  collection.save!
end

puts 'Done!'

# ----- Nik bookings below ----- #
puts 'Bookings for Nik incoming!'

collections = Collection.all
counter = 0

9.times do
  c = collections[counter]
  clean_users = c.user_id
  booking = Booking.new(
    collection: c,
    user: User.second,
    status: 2
  )
  booking.save!
  counter += 1
end

puts 'All done.'

puts 'Sorry, but we have to create 9 new collections... here we go!'

addresses = ["Nils Bays vei 64, Oslo, Oslo, Norway", "Kirsten Flagstads Plass 1, Oslo", "Karl Johans gate 11, Oslo, Oslo, Norway", "Landgangen 1, Oslo, Oslo, Norway", "Vulkan 5, 0178 Oslo", "Schweigaards gate 34C, 0191 Oslo", "Trondheimsveien 64, Oslo, Oslo, Norway", "Hagegata 27, Oslo, Oslo, Norway", "Helgesens gate 14, Oslo, Oslo, Norway", "Seilduksgata, Oslo, Oslo, Norway"]

neighborhoods = ["St. Hanshaugen - Ullevål", "Sentrum", "Sentrum", "Sentrum", "Sentrum", "Gamle Oslo", "Grūnerløkka - Sofienberg", "Gamle Oslo", "Grūnerløkka - Sofienberg", "Grūnerløkka - Sofienberg"]

details = ["I've left the bottles just outside the front gate. Cheers!", "Thanks! The cans are just behind the plant on the front porch. You can't miss it :)", "Thanks! Call me if there are any issues.", "Thanks for your help. I will be at work but just text me if you can't find the bag.", "Hey! Just ring the bell when you get inside. I'll buzz you in to let you grab the bottles. Our company is on the 4th floor!", "Text me if you can't find it.", "Should be easy to find but call me if you have any trouble.", "My apartment can be a bit hard to find, look for the gate next to the red door and just send me a text when you're close.", "Send me a text when you get here!", "Just look for my name and hit the buzzer! I'll come down with the bottles :)"]

SMALL_BOTTLES = [10, 15, 20, 25, 20, 25, 20, 30, 50, 100, 10, 25, 25, 20, 20, 25, 25, 10, 20]
BIG_BOTTLES = [5, 5, 5, 10, 10, 5, 10, 5, 10, 20, 25, 5, 5]

users = User.order(created_at: :asc).to_a
apple = users.shift
banana = users.shift
users

10.times do
  sb = SMALL_BOTTLES.sample
  bb = BIG_BOTTLES.sample
  t = TIP.sample
  r = (sb*2) + (bb*3) + t
  collection = Collection.new(
    address: addresses.pop,
    tip: t,
    small_bottles: sb,
    big_bottles: bb,
    reward: r,
    details: details.pop,
    user: users.sample,
    neighborhood: neighborhoods.pop,
    glass: GLASS.sample
  )
  collection.save!
end

puts "OK, now we're done."

