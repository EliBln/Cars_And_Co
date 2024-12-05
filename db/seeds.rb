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
user1 = User.create!(
  email: "user1@example.com",
  password: "password123",
  username: "UserOne"
)

user2 = User.create!(
  email: "user2@example.com",
  password: "password123",
  username: "UserTwo"
)

puts "Creating cars for user2..."
car1 = Car.create!(
  name: "Mercedes Class A",
  price: 1500,
  detail: "Automatic transmission, GPS, Leather seats",
  user: user2,
  img_url: "https://example.com/car_a.jpg",
  brand: "Mercedes",
  car_type: "Sedan",
  motorization: "Automatic",
  address: "16 Villa Gaudelet, Paris",
  start_date: Date.today,
  end_date: Date.today + 7
)

car2 = Car.create!(
  name: "BMW X5",
  price: 2000,
  detail: "4x4, Panoramic roof, Premium sound system",
  user: user2,
  img_url: "https://example.com/car_b.jpg",
  brand: "BMW",
  car_type: "SUV",
  motorization: "Automatic",
  address: "20 Avenue de Wagram, Paris",
  start_date: Date.today + 1,
  end_date: Date.today + 14
)

car3 = Car.create!(
  name: "Audi A3",
  price: 1200,
  detail: "Sport package, LED lights, Parking sensors",
  user: user2,
  img_url: "https://example.com/car_c.jpg",
  brand: "Audi",
  car_type: "Compact",
  motorization: "Manual",
  address: "35 Rue du Faubourg Saint-Antoine, Paris",
  start_date: Date.today + 2,
  end_date: Date.today + 10
)

puts "Seed completed! Created #{User.count} users and #{Car.count} cars"
