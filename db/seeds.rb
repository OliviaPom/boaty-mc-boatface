# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Boat.destroy_all
User.destroy_all

puts "creating new users"
user1 = User.create!(firstname: 'Alice' , lastname: 'renter' , email: "renter@example.com", password: "renter123")
user2 = User.create!(firstname: 'Leo', lastname: 'owner', email: "owner@example.com", password: "owner123")
user3 = User.create!(firstname: 'Clancy', lastname: 'owner', email: "owner2@example.com", password: "owner123")

puts "creating new boats"

[
  {name: 'Sunseeker', brand: 'Portofino 53', price: '1940', category: 'Yacht', location: 'Ibiza'},
  {name: 'Portofino 53', brand: 'Sunseeker', price: '1940', category: 'Yacht', location: 'Italy'},
  {name: 'V55', brand: 'Princess', price: '2236', category: 'Yacht', location: 'Croatia'},
  {name: 'C52', brand: 'Sessa Marine', price: '2460', category: 'Yacht', location: 'Greece'},
  {name: 'Lagoon 380 S2', brand: 'Ploto', price: '400', category: 'Catamaran', location: 'Spain'},
  {name: 'Astrea 42', brand: 'Fountain Pajot', price: '1147', category: 'Catamaran', location: 'Spain'},
  {name: '278 SS', brand: 'Montery', price: '619', category: 'Motorboat', location: 'Portugal'},
  {name: 'Voyager 19S', brand: 'Ranieri', price: '370', category: 'Motorboat', location: 'Ibiza'}
].each do |attributes|
  boat = Boat.new(attributes)
  boat.user = user2
  boat.save!
  puts "Created #{boat.name}"
end


puts "completed"

