# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Car.destroy_all
User.destroy_all

puts "Creating users..."
user = User.create(password: "azerty", email: "john@example.com")

puts "Creating cars..."
car = Car.new(
  name: "RS6 Avant",
  price: 125000,
  detail: "V8 bi-turbo 600ch, Pack carbone, Toit panoramique, Jantes 22 pouces",
  img_url: "https://example.com/audi-rs6.jpg",
  brand: "Audi",
  car_type: "Berline",
  motorization: "Essence"
)
car.user = user
car.save

puts "Finished! #{Car.count} cars created"
