# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# 5000.times do
#   Item.create!(
#     name: Faker::Artist.name,
#     description: Faker::Quote.famous_last_words,
#     price: Faker::Number.between(from: 300, to: 9999),
#     item_image: 'img_item.webp',
#     quantity: Faker::Number.between(from: 1, to: 10),
#     sub_category_id: rand(1..SubCategory.count)
#   )
# end

# 300.times do
# User.create!(
#   name: Faker::Name.name,
#   email: Faker::Internet.email,
#   password: 'password'
# )
# end

4000.times do
Review.create!(
  body: Faker::House.furniture,
  user_id: rand(1..User.count),
  item_id: rand(1..Item.count)
)
end
