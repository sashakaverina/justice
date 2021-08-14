require 'open-uri'

puts "Destroying previous seeds"
Incident.destroy_all
User.destroy_all
puts "Generating new seeds"


############################################
################# Users ####################
############################################

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

############################################
############ Shogo's incidents #############
############################################

incident1 = Incident.new(
  title: "Boss said vicious things to me",
  date: Date.parse('10/8/2021'),
  description: "We had our KPI meeting and while the meeting was going well, I asked my boss a simple question of 'What did I do not too great?' 
  As he was informing me, I felt they were unjust as they were not true. As I rebuttal, my boss
  started saying vicious things to me, such as 'You are a whiny worker', 'Why are you not like your other colleagues'. These 
  statements really hurt me.",
  place: "Takeda HQ"
)
incident1.user = shogo
incident1.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident1.save!


incident2 = Incident.new(
  title: "I was touched on the train",
  date: Date.parse('25/3/2020'),
  description: "I was taking the Yamanote line to get back home (Yoyogi station) at 9pm after finishing work.
  The car I got on was pretty crowded but living in Tokyo, this was the norm. As the train was going, I felt a hand near my bottom. Suddently, it grabbed my 
  bottom. I froze in shock and felt a need to defend myself. Unfortunately I could not since the train was crowded. Then I noticed that the man got off at the next station. 
  As I walked home, I felt nothing but shame.",
  place: "Yamanote line"
)
incident2.user = shogo
incident2.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident2.save!


incident3 = Incident.new(
  title: "He punched me",
  date: Date.parse('3/5/2021'),
  description: "My husband hit me as we were having an argument in our home",
  place: "491-1186, Akasaka Akasakaakuhiruzu.akumoribiru(1-kai), Minato-ku, Tokyo"
)
incident3.user = shogo
incident3.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident3.save!

############################################
############ Nomin's incidents #############
############################################

incident4 = Incident.new(
  title: "Boss said vicious things to me",
  date: Date.parse('10/8/2021'),
  description: "We had our KPI meeting and while the meeting was going well, I asked my boss a simple question of 'What did I do not too great?' 
  As he was informing me, I felt they were unjust as they were not true. As I rebuttal, my boss
  started saying vicious things to me, such as 'You are a whiny worker', 'Why are you not like your other colleagues'. These 
  statements really hurt me.",
  place: "Takeda HQ"
)
incident4.user = nomin
incident4.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident4.save!


incident5 = Incident.new(
  title: "I was touched on the train",
  date: Date.parse('25/3/2020'),
  description: "I was taking the Yamanote line to get back home (Yoyogi station) at 9pm after finishing work.
  The car I got on was pretty crowded but living in Tokyo, this was the norm. As the train was going, I felt a hand near my bottom. Suddently, it grabbed my 
  bottom. I froze in shock and felt a need to defend myself. Unfortunately I could not since the train was crowded. Then I noticed that the man got off at the next station. 
  As I walked home, I felt nothing but shame.",
  place: "Yamanote line"
)
incident5.user = nomin
incident5.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident5.save!


incident6 = Incident.new(
  title: "He punched me",
  date: Date.parse('3/5/2021'),
  description: "My husband hit me as we were having an argument in our home",
  place: "491-1186, Akasaka Akasakaakuhiruzu.akumoribiru(1-kai), Minato-ku, Tokyo"
)
incident6.user = nomin
incident6.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident6.save!

############################################
############ Aidan's incidents #############
############################################

bruise = URI.open('https://starkvilleurgentcareclinic.com/wp-content/uploads/2021/05/MVR_State_Blog_April_SeriousBruise_d2-scaled.jpeg')
swollen_lips = URI.open('https://cdn.shopify.com/s/files/1/2028/2057/articles/Swollen-Lips_1024x1024.jpg?v=1588938679')
yamanote = URI.open('https://live.staticflickr.com/91/214857943_533b578daa_c.jpg')

incident7 = Incident.new(
  title: "Boss said vicious things to me",
  date: Date.parse('10/8/2021'),
  description: "We had our KPI meeting and while the meeting was going well, I asked my boss a simple question of 'What did I do not too great?' 
  As he was informing me, I felt they were unjust as they were not true. As I rebuttal, my boss
  started saying vicious things to me, such as 'You are a whiny worker', 'Why are you not like your other colleagues'. These 
  statements really hurt me.",
  place: "Takeda HQ",
  attachment: "https://source.unsplash.com/640x400/?sleepingbag",
)
incident7.attachment.attach(io: bruise, filename: 'bruise.png', content_type: 'image/png')
incident7.user = aidan
incident7.tag_list.add("work", "boss", "hurt")
incident7.save!


incident8 = Incident.new(
  title: "I was touched on the train",
  date: Date.parse('25/3/2020'),
  description: "I was taking the Yamanote line to get back home (Yoyogi station) at 9pm after finishing work.
  The car I got on was pretty crowded but living in Tokyo, this was the norm. As the train was going, I felt a hand near my bottom. Suddently, it grabbed my 
  bottom. I froze in shock and felt a need to defend myself. Unfortunately I could not since the train was crowded. Then I noticed that the man got off at the next station. 
  As I walked home, I felt nothing but shame.",
  place: "Yamanote line"
)
incident8.attachment.attach(io: yamanote, filename: 'yamanote', content_type: 'image/png')
incident8.user = aidan
incident8.tag_list.add("home", "shame", "train")
incident8.save!


incident9 = Incident.new(
  title: "He punched me",
  date: Date.parse('3/5/2021'),
  description: "My husband hit me as we were having an argument in our home. Not only did the fight result in me having physical pain but also it hurt me deeply.",
  place: "491-1186, Akasaka Akasakaakuhiruzu.akumoribiru(1-kai), Minato-ku, Tokyo"
)
incident9.attachment.attach(io: swollen_lips, filename: 'swollen_lips.png', content_type: 'image/png')
incident9.user = aidan
incident9.tag_list.add("fight", "home", "hurt")
incident9.save!

############################################
############ Sasha's incidents #############
############################################

incident10 = Incident.new(
  title: "Boss said vicious things to me",
  date: Date.parse('10/8/2021'),
  description: "We had our KPI meeting and while the meeting was going well, I asked my boss a simple question of 'What did I do not too great?' 
  As he was informing me, I felt they were unjust as they were not true. As I rebuttal, my boss
  started saying vicious things to me, such as 'You are a whiny worker', 'Why are you not like your other colleagues'. These 
  statements really hurt me.",
  place: "Takeda HQ"
)
incident10.user = sasha
incident10.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident10.save!


incident11 = Incident.new(
  title: "I was touched on the train",
  date: Date.parse('25/3/2020'),
  description: "I was taking the Yamanote line to get back home (Yoyogi station) at 9pm after finishing work.
  The car I got on was pretty crowded but living in Tokyo, this was the norm. As the train was going, I felt a hand near my bottom. Suddently, it grabbed my 
  bottom. I froze in shock and felt a need to defend myself. Unfortunately I could not since the train was crowded. Then I noticed that the man got off at the next station. 
  As I walked home, I felt nothing but shame.",
  place: "Yamanote line"
)
incident11.user = sasha
incident11.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident11.save!


incident12 = Incident.new(
  title: "He punched me",
  date: Date.parse('3/5/2021'),
  description: "My husband hit me as we were having an argument in our home",
  place: "491-1186, Akasaka Akasakaakuhiruzu.akumoribiru(1-kai), Minato-ku, Tokyo"
)
incident12.user = sasha
incident12.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
incident12.save!



# mrX = Antagonizer.create!(
#   name: "Mr. X"
# )

# bowser = Antagonizer.create!(
#   name: "Bowser"
# )

# work = Collection.create!(
#   name: "Work"
# )

# gym = Collection.create!(
#   name: "Gym"
# )

# incident1 = Incident.new(
#   date: Date.parse('1/8/2021'),
#   title: "Boss yelled at me",
#   description: "Oh no. This is unacceptable"
# )

# incident1.user = shogo
# incident1.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
# incident1.save!

# incident2 = Incident.new(
#   date: Date.parse('1/8/2021'),
#   title: "Colleague yelled at me",
#   description: "Oh no. This is unacceptable"
# )

# incident2.user = sasha
# incident2.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
# incident2.save!

# incident3 = Incident.new(
#   date: Date.parse('1/8/2021'),
#   title: "Husband yelled at me",
#   description: "Oh no. This is unacceptable"
# )

# incident3.user = aidan
# incident3.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
# incident3.save!

# incident4 = Incident.new(
#   date: Date.parse('1/8/2021'),
#   title: "Neighbor yelled at me",
#   description: "Oh no. This is unacceptable"
# )

# incident4.user = nomin
# incident4.tag_list.add("work", "fight", "home", "hurt", "boss", "police", "boyfriend", "violence", "LGBT", "doctor", "hospital")
# incident4.save!

puts "Seed generation completed"
