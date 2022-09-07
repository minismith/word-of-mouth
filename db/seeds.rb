# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"
Restaurant.delete_all
User.delete_all

# // RESTAURANTS //

puts "creating restaurants"

Restaurant.create(name: "Pizza Express", address: "SE11 4AA", website: "https://www.pizzaexpress.com/", price: "£", cuisine: "Italian", photo: "https://dmmids2yas2hi.cloudfront.net/pizzaexpress/2c-op-5_5e70a9f3e51686_49400509.jpg")
Restaurant.create(name: "Tower Tandori", address: "SE1 4TP", website: "https://www.towertandoori.co.uk/", price: "££", cuisine: "Indian", photo: "https://images.otstatic.com/prod/24011333/1/large.jpg")
Restaurant.create(name: "Noodle House", address: "SW10 0RH", website: "https://www.zomato.com/london/the-noodle-house-covent-garden", price: "£", cuisine: "Chinese", photo: "https://just-eat-prod-sg-res.cloudinary.com/image/upload/c_fill,f_auto,q_auto,w_1200,h_630,d_au:cuisines:asian-2.jpg/v1/au/restaurants/11031782.jpg")
Restaurant.create(name: "Entrocote", address: "EC2V 7NG", website: "https://relaisdevenise.com/", price: "£££", cuisine: "French", photo: "https://www.thespruceeats.com/thmb/jdAEYIcHZAjecW80x9YXiMH9A1E=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/chateaubriand-recipe-1375530-hero-01-1803de3eebc0401fa6406693f32e9e8f.jpg")
Restaurant.create(name: "Burger Heaven", address: "E2 8LS", website: "https://www.honestburgers.co.uk/", price: "££", cuisine: "American", photo: "https://media.timeout.com/images/105422478/image.jpg")

puts "restaurants complete"

# // USERS //

puts "creating users"

5.times do
  @users = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password"
  )
  @users.save!
end

puts "users complete"
