# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Rent.destroy_all
Device.destroy_all
User.destroy_all

puts 'Creating users...'
arthur = User.create!(first_name: "arthur", last_name: "Deleval", genre: "homme", birth_date: 24, phone_number: 064535, address: "30 rue des glycines", nickname: "tutur", zipcode: 59000, email: "arthur@gmail.com", password: "azerty")
puts 'Finished!'
