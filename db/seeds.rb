[User, Holiday, Group].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

# todayDate = Time.new
# todayDate.strftime("%d/%m/%Y")        # "05/12/2015"
# time.strftime("%k:%M")           # "17:48"
# time.strftime("%I:%M %p")        # "11:04 PM"
# time.strftime("Today is %A")     # "Today is Sunday"
# time.strftime("%d of %B, %Y")    # "21 of December, 2015"
# time.strftime("Unix time is %s") # "Unix time is 1449336630"

# puts todayDate

todayDate = Time.new.strftime("%d/%m/%Y") # "05/12/2015"

raiden = User.create!(
  username: "Raiden",
  email: "raiden@me.com",
  image: "http://cdn.onlinewebfonts.com/svg/img_568656.png",
  password: "p",
  password_confirmation: "p",
  bio: "Software Engineer",
  airport: "LHR"
)

row = User.create!(
  username: "Row",
  email: "row@me.com",
  image: "http://cdn.onlinewebfonts.com/svg/img_568656.png",
  password: "p",
  password_confirmation: "p",
  bio: "Masseur",
  airport: "STN"
)

luca = User.create!(
  username: "Luca",
  email: "luca@me.com",
  image: "http://cdn.onlinewebfonts.com/svg/img_568656.png",
  password: "p",
  password_confirmation: "p",
  bio: "Hair Dresser, Hair Stylist",
  airport: "LGW"
)

epp = User.create!(
  username: "Epp",
  email: "epp@me.com",
  image: "http://cdn.onlinewebfonts.com/svg/img_568656.png",
  password: "p",
  password_confirmation: "p",
  bio: "BM",
  airport: "LGW"
)

ebrio = User.create!(
  username: "Ebrio",
  email: "ebrio@me.com",
  image: "http://cdn.onlinewebfonts.com/svg/img_568656.png",
  password: "p",
  password_confirmation: "p",
  bio: "BM",
  airport: "LGW"
)

boys = Group.create!(
  name: "The Boys",
  creator: raiden,
  attendees: [raiden, row, luca]
)

juicers = Group.create!(
  name: "JQs",
  creator: raiden,
  attendees: [raiden, epp, ebrio]
)

Holiday.create!(
  image: "https://unsplash.com/photos/uWpggIb3iHs",
  location: "Maldives, South Asia",
  departureAirport: "LHR",
  arrivalAirport: "MLE",
  attractions: "The Vast Ocean!",
  when_to_go: "September - April",
  departureDate: todayDate,
  returnDate: todayDate,
  user: raiden,
  group: boys
)

Holiday.create!(
  image: "https://unsplash.com/photos/uWpggIb3iHs",
  location: "Barcelona, Spain",
  departureAirport: "LHR",
  arrivalAirport: "BCN",
  attractions: "The Beach lol",
  when_to_go: "May - September",
  departureDate: todayDate,
  returnDate: todayDate,
  user: raiden,
  group: juicers
)

# Holiday.create!(
#   image: "https://www.telegraph.co.uk/travel/destinations/europe/greece/cyclades/mykonos/articles/mykonos-expert-travel-guide/",
#   location: "Mykonos, Greece",
#   departureAirport: "LHR",
#   arrivalAirport: "JMK",
#   description: "Paradise for all!",
#   attractions: "The beach, town, people, lifestyle, etc",
#   when_to_go: "September - October",
#   # departureDate: todayDate,
#   # returnDate: todayDate,
#   user: raiden,
#   group: boys
# )
