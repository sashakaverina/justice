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

incident1 = Incident.new(
  date: Date.parse('1/8/2021'),
  title: "Boss yelled at me",
  description: "Oh no. This is unacceptable"
)

incident1.user = shogo
incident1.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident1.save!

incident2 = Incident.new(
  date: Date.parse('1/8/2021'),
  title: "Colleague yelled at me",
  description: "Oh no. This is unacceptable"
)

incident2.user = sasha
incident2.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident2.save!

incident3 = Incident.new(
  date: Date.parse('1/8/2021'),
  title: "Husband yelled at me",
  description: "Oh no. This is unacceptable"
)

incident3.user = aidan
incident3.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident3.save!

incident4 = Incident.new(
  date: Date.parse('1/8/2021'),
  title: "Neighbor yelled at me",
  description: "Oh no. This is unacceptable"
)

incident4.user = nomin
incident4.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident4.save!

puts "Data generation completed"
