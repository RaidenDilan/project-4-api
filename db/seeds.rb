[User, Holiday, Group].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

raiden = User.create!(username: "Raiden", image: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", email: "raiden1@me.com", first_name: "Raiden", last_name: "Dilan", password: "password", bio: "Learn about me from this link", airport: "London Heathrow")

row = User.create!(username: "Row", email: "row@me.com", image: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", first_name: "Row", last_name: "Dilan", password: "password", bio: "He's a Geezer", airport: "London Heathrow")

luca = User.create!(username: "Luca", email: "luca@me.com", image: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", first_name: "Luca", last_name: "Ancelotti", password: "password", bio: "Awesome dude!", airport: "London Gatwick")

Holiday.create!(cover_photo: "http://www.biznuspayroll.co.uk/wp-content/uploads/2015/10/Holiday.jpg", location: "Maldives", nearest_airport: "Hanimaadhoo International Airport", description: "the best beach ever!", attractions: "The Ocean!",when_to_go: "January - February", image_one: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_two: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_three: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_four: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", user: raiden)

Holiday.create!(cover_photo: "http://www.biznuspayroll.co.uk/wp-content/uploads/2015/10/Holiday.jpg", location: "Spain", nearest_airport: "Hanimaadhoo International Airport", description: "Who doesn't love spain!", attractions: "The Ocean!",when_to_go: "March - August", image_one: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_two: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_three: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_four: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", user: raiden)

Holiday.create!(cover_photo: "http://www.biznuspayroll.co.uk/wp-content/uploads/2015/10/Holiday.jpg", location: "Maldives", nearest_airport: "Hanimaadhoo International Airport", description: "the best beach ever!", attractions: "The Ocean!",when_to_go: "January - February", image_one: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_two: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_three: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_four: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", user: luca)

Holiday.create!(cover_photo: "http://www.biznuspayroll.co.uk/wp-content/uploads/2015/10/Holiday.jpg", location: "Spain", nearest_airport: "Hanimaadhoo International Airport", description: "Who doesn't love spain!", attractions: "The Ocean!",when_to_go: "March - August", image_one: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_two: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_three: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_four: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", user: luca)

Holiday.create!(cover_photo: "http://www.biznuspayroll.co.uk/wp-content/uploads/2015/10/Holiday.jpg", location: "Maldives", nearest_airport: "Hanimaadhoo International Airport", description: "the best beach ever!", attractions: "The Ocean!",when_to_go: "January - February", image_one: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_two: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_three: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_four: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", user: row)

Holiday.create!(cover_photo: "http://www.biznuspayroll.co.uk/wp-content/uploads/2015/10/Holiday.jpg", location: "Spain", nearest_airport: "Hanimaadhoo International Airport", description: "Who doesn't love spain!", attractions: "The Ocean!",when_to_go: "March - August", image_one: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_two: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_three: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", image_four: "http://combiboilersleeds.com/images/holiday/holiday-7.jpg", user: row)

# livelife = Group.create!(name: "Live Life", user: raiden, holiday: maldives)
#
# livethedream = Group.create!(name: "Live the dream", user: row, holiday: spain)
#
# Post.create!(name: "Maldives", user: raiden, holiday: maldives, group: livelife)
#
# Post.create!(name: "Maldives", user: raiden, holiday: maldives, group: livethedream)

# Comment.create!(body: "wow wow wow!", user: raiden, group: livelife, post: mypost)
