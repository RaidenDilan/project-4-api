[User, Holiday, Group, Membership].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

dateOne    = Date.today + 7
dateTwo    = Date.today + 14

departDate = dateOne.strftime("%Y/%m/%d")
returnDate = dateTwo.strftime("%Y/%m/%d")

raiden     = User.create!(username: "Raiden", email: "raiden@me.com", image: File.open(File.join(Rails.root, "db/images/avatar.png")), password: "p", password_confirmation: "p", bio: "Software Engineer", airport: "LHR")
row        = User.create!(username: "Row", email: "row@me.com", image: File.open(File.join(Rails.root, "db/images/avatar.png")), password: "p", password_confirmation: "p", bio: "Masseur", airport: "STN")
luca       = User.create!(username: "Luca", email: "luca@me.com", image: File.open(File.join(Rails.root, "db/images/avatar.png")), password: "p", password_confirmation: "p", bio: "Hair Dresser, Hair Stylist", airport: "LGW")
epp        = User.create!(username: "Epp", email: "epp@me.com", image: File.open(File.join(Rails.root, "db/images/avatar.png")), password: "p", password_confirmation: "p", bio: "BM", airport: "LGW")
ebrio      = User.create!(username: "Ebrio", email: "ebrio@me.com", image: File.open(File.join(Rails.root, "db/images/avatar.png")), password: "p", password_confirmation: "p", bio: "BM", airport: "LGW")

boys       = Group.create!(name: "The Boys", creator: raiden)
juicers    = Group.create!(name: "JQs", creator: raiden)
kr2        = Group.create!(name: "KR2", creator: epp)

maldives   = Holiday.create!(image: File.open(File.join(Rails.root, "db/images/maldives-3.jpg")), location: "Maldives, South Asia", departureAirport: "LHR", arrivalAirport: "MLE", attractions: "The Vast Ocean!", when_to_go: "September - April", departureDate: departDate, returnDate: returnDate, user: raiden, group: boys)
barcelona  = Holiday.create!(image: File.open(File.join(Rails.root, "db/images/home.jpg")), location: "Barcelona, Spain", departureAirport: "LHR", arrivalAirport: "BCN", attractions: "The Beach lol", when_to_go: "May - September", departureDate: departDate, returnDate: returnDate, user: raiden, group: juicers)

Membership.create!(group: boys, user: raiden)
Membership.create!(group: boys, user: luca)
Membership.create!(group: boys, user: row)
Membership.create!(group: kr2, user: ebrio)

Comment.create!(holiday: maldives, body: "SWEEEET!", user: raiden)
Comment.create!(holiday: barcelona, body: "WOW!", user: raiden)
