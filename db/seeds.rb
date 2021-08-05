require 'open-uri'

puts "Destroying previous data"
Incident.destroy_all
User.destroy_all

nomin = User.create!(
    email: "nmn@gmail.com",
    password: "111111",
    first_name: "Nomin",
    last_name: "Batsaikhan",
    location: "2-11-3 Meguro, Meguro City, Tokyo",
    picture: "https://kitt.lewagon.com/placeholder/users/Nomioooob"
  
  )
  
  aidan = User.create!(
    email: "aidan@gmail.com",
    password: "111111",
    first_name: "Aidan",
    last_name: "Fournier",
    location: "1-1 Chiyoda, Chiyoda City, Tokyo",
    picture: "https://kitt.lewagon.com/placeholder/users/AidanFournier"
  )
  
  sasha = User.create!(
    email: "sasha@gmail.com",
    password: "111111",
    first_name: "Sasha",
    last_name: "Kaverina",
    location: "2-1 Chiyoda, Chiyoda City, Tokyo",
    picture: "https://kitt.lewagon.com/placeholder/users/sashakaverina"
  )
  
  shogo = User.create!(
    email: "shogo@gmail.com",
    password: "111111",
    first_name: "Shogo",
    last_name: "Miyagi",
    location: "Tokyo, Shibuya City, Shibuya, 3−21−3",
    picture: "https://kitt.lewagon.com/placeholder/users/80andAbove"
  )