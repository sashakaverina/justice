require 'open-uri'

puts "Destroying previous data"
Incident.destroy_all
User.destroy_all
puts "Generating new data"

nomin = User.create!(
    email: "nmn@gmail.com",
    password: "111111",
    nickname: "Nomin",
)

aidan = User.create!(
  email: "aidan@gmail.com",
  password: "111111",
  nickname: "Aidan",
)

sasha = User.create!(
  email: "sasha@gmail.com",
  password: "111111",
  nickname: "Sasha",
)

shogo = User.create!(
  email: "shogo@gmail.com",
  password: "111111",
  nickname: "Shogo",
)

mrX = Antagonizer.create!(
  name: "Mr. X"
)

bowser = Antagonizer.create!(
  name: "Bowser"
)

work = Collection.create!(
  name: "Work"
)

gym = Collection.create!(
  name: "Gym"
)

tokyo = Place.create(
  name: "Tokyo",
  address: "Shibuya-ku"
)

osaka = Place.create(
  name: "Osaka",
  address: "Dotonburi"
)

incident1 = Incident.create!(
  date: Date.parse('1/8/2021'),
  description: "Boss yelled at me",
  antagonizer_id: 3,
  collection_id: 3,
  user_id: 1,
  place_id: 3
)

puts "Data generation completed"