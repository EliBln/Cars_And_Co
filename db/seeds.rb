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
user.save

puts "Creating cars..."
20.times do
  car = Car.new(name: Faker::Vehicle.model, price: Faker::Number.number(digits: 4), detail: Faker::Vehicle.standard_specs, img_url: Faker::LoremFlickr.image, brand: Faker::Vehicle.make, car_type: Faker::Vehicle.car_type, motorization: Faker::Vehicle.transmission)
  car.user = user
  car.save
end

puts "Finished! #{Car.count} cars created"
