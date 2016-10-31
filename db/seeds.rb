# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
25.times do
  user = User.create(
    username: Faker::Superhero.name,
    email_address: Faker::Internet.free_email,
    password: Faker::Internet.password(8)
    )
end


25.times do
  Post.create(
  title: Faker::GameOfThrones.character,
  link: Faker::Internet.url,
  user: User.find(rand(1..25)),
  summary: Faker::Hipster.sentence,
  vote: rand(3..150)
)
end
