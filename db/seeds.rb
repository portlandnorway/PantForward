# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
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
    email: 'nikolai@mangen.no',
    first_name: 'Nikolai',
    last_name: 'Toverud',
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  user.save!
end

puts 'Done!'

1.times do
  user = User.new(
    email: 'dennis.neely22@gmail.com',
    first_name: 'Dennis',
    last_name: 'Neely',
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  user.save!
end

MALES = ["https://images.unsplash.com/photo-1513690277738-c9bc7eb2a992?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1542909168-6296a31d7689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1563701039037-37a8ea2e79be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1546458904-143d1674858d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1554114867-3e4ffcba7762?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1578176603894-57973e38890f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1505975410356-cec53a6cdec9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1553867745-6e038d085e86?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1540574573343-bdd23b70c48b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1517588632672-9758d6acba04?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1578597096845-8854485e8753?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1505247964246-1f0a90443c36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1515175704145-8a06ffce6b77?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"]

FEMALES = ["https://images.unsplash.com/photo-1517365830460-955ce3ccd263?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1564061170517-d3907caa96ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1562124638-724e13052daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1556541516-6df3db2bc84f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1579503841516-e0bd7fca5faa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1485893086445-ed75865251e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1496439786094-e697ca3584d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1530519370550-209c4d0f6577?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1530519486016-6ebc8a343be5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1525735765456-7f67273a9d93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1508767887031-185bbeb45718?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1534945773093-1119ae5684ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"]

male_img = 0
female_img = 0

puts 'Creating 12 fake women...'
12.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  file = URI.open(FEMALES[female_img])
  user.avatar.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  user.save!
  female_img += 1
end

puts 'Creating 13 fake men...'
13.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  file = URI.open(MALES[male_img])
  user.avatar.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  user.save!
  male_img += 1
end

puts 'Finished with the users!'

ADDRESSES = ["Kirsten Flagstads Plass 1, 0150 Oslo", "Karl Johans gate 11, 0154 Oslo", "Slottsplassen 1, 0010 Oslo", "Pilestredet 72, 0354 Oslo", "Seilduksgata 15A, 0553 Oslo", "Lørenveien 38, 0585 Oslo", "Sverresgate 5, 0652 Oslo", "Ekebergveien 1, 0192 Oslo", "Ulvenveien 110, 0665 Oslo"]

DETAILS = ["I've left the bottles just outside the front gate. Cheers!", "Thanks! The cans are just behind the plant on the front porch. You can't miss it :)", "Thanks! Call me if there are any issues.", "Thanks for your help. I will be at work but just text me if you can't find the bag.", "Hey! Just ring the bell when you get inside. I'll buzz you in to let you grab the bottles. Our company is on the 4th floor!", "Text me if you can't find it.", "Should be easy to find but call me if you have any trouble.", "My apartment can be a bit hard to find, look for the gate next to the red door and just send me a text when you're close.", "Send me a text when you get here!", "Just look for my name and hit the buzzer! I'll come down with the bottles :)"]

BOTTLES = [10, 15, 20, 25, 30, 50, 100, 10, 10, 10, 20, 20, 25, 10, 10, 5, 5, 20]

puts 'Creating 9 fake collections...'

users = User.all.to_a

9.times do
  collection = Collection.new(
    address: ADDRESSES.pop,
    tip: Faker::Number.number(digits: 2),
    bottles: BOTTLES.sample,
    details: DETAILS.pop,
    donator: users.pop,
    collector: users.pop
  )
  collection.save!
end

puts 'Finished with the collections!'
puts "Do you want a tractor also? Download Get Tractors now!"
