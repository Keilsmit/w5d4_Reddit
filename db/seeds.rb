# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  username: Faker::Internet.user_name('Nancy Johnson', %w(. _ -)),
  email_address: Faker::Internet.free_email,
  password: Faker::Internet.password(8)
  )

25.times do
  Post.create(
  title: Faker::GameOfThrones.character,
  link: Faker::Internet.url,
  user_id: user.id,
  summary: Faker::Hipster.sentence,
  vote: rand(3..150)
)
end
