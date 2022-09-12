# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"
Review.delete_all
Restaurant.delete_all
User.delete_all

# // RESTAURANTS //

puts "creating restaurants"


Restaurant.create(name: "Tower Tandori", address: "SE1 4TP", website: "https://www.towertandoori.co.uk/", price: "££", cuisine: "Indian", photo: "https://i0.wp.com/chennaifoodblog.in/wp-content/uploads/2019/03/types-indian-cuisines.jpg?resize=780%2C405&ssl=1")
Restaurant.create(name: "Neds Noodle Bar", address: "N1 6HB", website: "nedsnoodlebar.com", price: "£", cuisine: "Chinese", photo: "https://just-eat-prod-eu-res.cloudinary.com/image/upload/c_fill,f_auto,q_auto,w_1200,h_630,d_uk:cuisines:noodles-7.jpg/v1/uk/restaurants/1257.jpg")
Restaurant.create(name: "Entrocote", address: "W1U 2QG", website: "https://relaisdevenise.com/", price: "£££", cuisine: "French", photo: "https://www.spinneyslebanon.com/media/recipe//entre.jpg")
Restaurant.create(name: "The Posh Burger", address: "EC1V 9AY", website: "alleatapp.com", price: "££", cuisine: "American", photo: "https://media.timeout.com/images/105422478/image.jpg")
Restaurant.create(name: "Kothu", address: "SW17 0RR", website: "https://kothu-sri-lankan-restaurant-bar.business.site/", price: "££", cuisine: "Sri Lankan", photo: "https://rs-menus-api.roocdn.com/images/8620c648-bcfe-406c-8c57-fea8ccf40b32/image.jpeg?width=1200&height=630&fit=crop")
Restaurant.create(name: "Camberwell Arms", address: "SE5 8TR", website: "thecamberwellarms.co.uk", price: "£", cuisine: "English", photo: "https://cdn.thenudge.com/wp-content/uploads/2019/12/hh-camberwell-arms15716.jpg")
Restaurant.create(name: "Gokyuzu", address: "N12 0QZ", website: "https://gokyuzurestaurant.co.uk/", price: "££", cuisine: "Turkish", photo: "https://gokyuzurestaurant.co.uk/finchley/wp-content/uploads/sites/8/2018/10/turkish-food-at-Gokyuzu-finchley-3.jpg")
Restaurant.create(name: "Mc & Sons", address: "SE1 0LH", website: "http://mcandsonslondon.com/", price: "£", cuisine: "Thai", photo: "https://pickyglutton.files.wordpress.com/2019/08/vegetarian-spring-rolls-at-mc-and-sons.jpg")
Restaurant.create(name: "Pizza Union", address: "N1 9JY", website: "https://www.pizzaunion.com/", price: "£", cuisine: "Italian", photo: "https://www.hotandchilli.com/wp-content/uploads/2015/08/C2A9Rosana_McPhee_Hotandchilliblog_PizzaUnionKingsX-0551.jpg")
Restaurant.create(name: "Urban chocolatier", address: "HA9 6AA", website: "https://urbanchocolatier.com/", price: "££", cuisine: "Belgian", photo: "https://www.feedthelion.co.uk/wp-content/uploads/urban-chocolatier-scaled.jpg" )

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
