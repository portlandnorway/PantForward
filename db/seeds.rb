# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


puts "Clearing the db..."
Collection.destroy_all
User.destroy_all

puts 'Creating admins...'

1.times do
  user = User.new(
    email: 'nikolai@mangen.no',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  user.save!
end

puts 'Done!'

1.times do
  user = User.new(
    email: 'dennis.neely22@gmail.com',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  user.save!
end

puts 'Creating 25 fake users...'
25.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.subscriber_number(length: 8),
    password: 'password'
  )
  user.save!
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
    user: users.pop,
  )
  collection.save!
end

puts 'Finished with the collections!'
puts "Do you want a tractor also? Download Get Tractors now!"
