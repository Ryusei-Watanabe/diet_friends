# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# password = "aaaaaa"
# user = User.new(
#     name: "test01",
#     email: "test01@test.com",
#     password: password,
#     password_confirmation: password,
#     body_weight: 100,
#     target_weight: 40,
#     profile: "がんばります",
#     icon: open("./db/fixtures/icon10.jpg")
# )
# user.save!
1.times do
  password = "aaaaaa"
  User.create!(
      name: "test01",
      email: "test01@test.com",
      password: password,
      password_confirmation: password,
      body_weight: 70,
      target_weight: 65,
      profile: "シード1",
      icon: open("./db/fixtures/icon00.jpg")
  )
end
9.times do |n|
  n = 1
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "aaaaaa"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    body_weight: 70,
    target_weight: 65,
    profile: "シード#{n + 1}",
    icon: open("./db/fixtures/icon0#{n + 1}.jpg")
  )
end
10.times do |n|
  title = Faker::Music.band
  study= Faker::Music.album
  Diary.create!(
      title: title,
      study: study,
      body_weight: 70-(n-1),
      create_date: "2020-8-#{n+1}",
      user_id: 1,
  )
end
10.times do |n|
  title = Faker::Music.band
  study= Faker::Music.album
  Diary.create!(
      title: title,
      study: study,
      body_weight: 70-(n-1),
      create_date: "2020-8-#{n+1}",
      user_id: 2,
      )
end
1.times do
  Relationship.create!(
    follower_id: 1,
    followed_id: 2,
  )
end
1.times do
  Relationship.create!(
      follower_id: 2,
      followed_id: 1,
      )
end
1.times do |n|
  Group.create!(
      name: "sample#{n+1}"
      )
end
1.times do
  Assign.create!(
      user_id: 1,
      group_id: 1,
      )
end
1.times do
  Assign.create!(
      user_id: 2,
      group_id: 1,
      )
end
1.times do |n|
  Chat.create!(
      content: "サンプル#{n+1}",
      image: open("./db/fixtures/icon0#{n + 1}.jpg"),
      group_id: 1,
      user_id: 1,
      )
end
