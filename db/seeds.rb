# [User, Holiday, Group].each do |model|
#   ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
# end
#
# raiden = User.create!(username: "Raiden", email: "raiden@me.com", image: "https://gravatar.com/avatar/cd62d88a83461e0b1daa8f2fa31c4dcb?s=512&d=https://codepen.io/assets/avatars/user-avatar-512x512-6e240cf350d2f1cc07c2bed234c3a3bb5f1b237023c204c782622e80d6b212ba.png", first_name: "Raiden", last_name: "Dilan", password: "password", bio: "Learn about me from this link", airport: "LHR")
#
# row = User.create!(username: "Row", email: "row@me.com", image: "http://coussej.github.io/images/avatar.png", first_name: "Row", last_name: "Dilan", password: "password", bio: "He's a Geezer", airport: "STN")
#
# luca = User.create!(username: "Luca", email: "luca@me.com", image: "https://www.tm-town.com/assets/default_male300x300-aae6ae0235b6cd78cee8df7ae19f6085.png", first_name: "Luca", last_name: "Ancelotti", password: "password", bio: "Awesome dude!", airport: "LGW")
#
# will = User.create!(username: "Will", email: "willhilton@me.com", image: "https://avatars1.githubusercontent.com/u/20931104?v=3&s=400", first_name: "Will", last_name: "Hilton", password: "password", bio: "Smoker!", airport: "LCY")
#
# hello = Group.create!(name: "Honeymooners", creator: raiden, attendees: [row, luca, will])
# # Group.create!(name: "Adventure", creator: raiden, attendees: [will, raiden])
# # Group.create!(name: "Around the world", creator: raiden, attendees: [luca, row])
#
#
# Holiday.create!(cover_photo: "https://s-media-cache-ak0.pinimg.com/originals/60/4c/cf/604ccfb90dc674bad0ff368801900038.jpg", location: "Bondi Beach, Sydney", departureAirport: "LHR", arrivalAirport: "SYD", description: "the best beach ever!", attractions: "The Ocean!", when_to_go: "September - November & March - May", image_one: "https://media.timeout.com/images/102997885/image.jpg", image_two: "http://cdn.concreteplayground.com/content/uploads/2014/10/Manly_Beach.jpg", image_three: "http://cdn.concreteplayground.com/content/uploads/2015/10/cubby-house-milk-beach1.jpg", image_four: "http://www.pristine-agency.biz/wp-content/uploads/Na-Pali-Coast-on-Kauaism-1.jpg", departureDate: "01/06/2017", returnDate: "21/06/2017", user: raiden, group: hello)
#
# Holiday.create!(cover_photo: "http://cdni.condenast.co.uk/1440x960/s_v/shangri-la-villingili-resort-and-spa-maldives-conde-nast-traveller-1april14-pr_1440x960.jpg", location: "Maldives", departureAirport: "LHR", arrivalAirport: "KDM", description: "Paradise for everyone!", attractions: "The Vast Ocean!", when_to_go: "September - April", image_one: "http://cdni.condenast.co.uk/646x430/a_c/ayada_cnt_25aug11_pr.jpg", image_two: "https://cdn.kiwicollection.com/media/property/PR100720/xl/100720-11-Milaidhoo%20Maldives%20water%20pool%20villa.jpg", image_three: "http://gq-images.s3.amazonaws.com/c4/27/97083d0b.jpg", image_four: "https://www.ampersandtravel.com/CropUp/962x540/media/55403/Maldives-banner-2-.jpg?quality=79", departureDate: "01/06/2017", returnDate: "21/06/2017", user: raiden, group: hello)
#
# Holiday.create!(cover_photo: "https://i0.wp.com/www.windependent.co.uk/wp-content/uploads/2016/08/DSC_0059.jpg?resize=672%2C372", location: "Sant Miquel, Barcelona", departureAirport: "LHR", arrivalAirport: "BCN", description: "Paradise for everyone!", attractions: "The beach, the girls and the parties", when_to_go: "May - September", image_one: "http://www.apartmentbarcelona.com/blog/wp-content/uploads/2012/06/barceloneta-beach3.jpg", image_two: "http://www.esprent.com/wp-content/uploads/2014/07/Sant-Sebastia-Beach-and-W-hotel.jpg", image_three: "http://www.petitpalace.com/blog/wp-content/uploads/2014/07/78160653-1-670x438.jpg", image_four: "http://www.barcelonacheckin.com/img/stored_images/barcelona/articles_images/whitesandofSantSebastia.jpg", departureDate: "01/06/2017", returnDate: "21/06/2017", user: raiden, group: hello)
#
# Holiday.create!(cover_photo: "http://paradiseintheworld.com/wp-content/uploads/2012/03/honolulu-beach.jpg", location: "Honolulu, Hawaii", departureAirport: "LHR", arrivalAirport: "HNL", description: "Paradise for honeymooners!", attractions: "The beach, music & nature", when_to_go: "May - September", image_one: "http://www.kaliteliresimler.com/data/media/72/Hawaii_deniz_manzarasi.jpg", image_two: "http://the.honoluluadvertiser.com/dailypix/2009/Oct/18/hawaii910180399V3_b.jpg", image_three: "https://makeachange1.files.wordpress.com/2013/09/maui-beach-hawaii.jpg", image_four: "http://www.smartdestinations.com/blog/wp-content/uploads/2015/04/Diamond-Head-Crater-Hawaii.jpg", departureDate: "01/06/2017", returnDate: "21/06/2017", user: raiden, group: hello)
#
# Holiday.create!(cover_photo: "http://www.etravelblog.com/wp-content/uploads/2015/08/Fotolia_85343690_Subscription_Monthly_M.jpg", location: "Stockholm, Sweden", departureAirport: "LHR", arrivalAirport: "ARN", description: "It's cold and depressing!", attractions: "Swedish Girls", when_to_go: "May - September", image_one: "http://www.simplystockholm.org/Sstock/wp-content/uploads/summer-stockholm.jpg", image_two: "http://mustseeplaces.eu/wp-content/uploads/2016/01/stockholm-archipelago.jpg", image_three: "https://s-media-cache-ak0.pinimg.com/originals/2e/46/a0/2e46a06ef940f6ed40ad85592262bfd1.jpg", image_four: "http://www.localstay.com/wp-content/uploads/2013/08/Stockholm.jpg", departureDate: "01/06/2017", returnDate: "21/06/2017", user: raiden, group: hello)

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

raiden = User.create!(
  username: "Raiden",
  email: "raiden@me.com",
  image: "http://cdn.onlinewebfonts.com/svg/img_568656.png",
  password: "p",
  bio: "Software Engineer",
  airport: "LHR"
)

row = User.create!(
  username: "Row",
  email: "row@me.com",
  image: "http://cdn.onlinewebfonts.com/svg/img_568656.png",
  password: "p",
  bio: "Masseur",
  airport: "STN"
)

luca = User.create!(
  username: "Luca",
  email: "luca@me.com",
  image: "http://cdn.onlinewebfonts.com/svg/img_568656.png",
  password: "p",
  bio: "Hair Dresser, Hair Stylist",
  airport: "LGW"
)

boys = Group.create!(
  name: "The boys",
  creator: raiden,
  attendees: [raiden, row, luca]
)

# Group.create!(name: "Adventure", creator: raiden, attendees: [will, raiden])
# Group.create!(name: "Around the world", creator: raiden, attendees: [luca, row])

Holiday.create!(
  cover_photo: "https://unsplash.com/photos/uWpggIb3iHs",
  location: "Maldives, South Asia",
  departureAirport: "LHR",
  arrivalAirport: "MLE",
  description: "Paradise for everyone!",
  attractions: "The Vast Ocean!",
  when_to_go: "September - April",
  # image_one: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwisvPST17jlAhUjzYUKHXboCMoQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.scmp.com%2Fmagazines%2Fstyle%2Ftravel-food%2Farticle%2F2169757%2F7-things-you-should-know-your-first-trip-maldives&psig=AOvVaw0xpl1Vfk-leXFwdC1FaGjW&ust=1572136539749824",
  # image_two: "https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiHyoGY17jlAhVMUxoKHQKoBQwQjRx6BAgBEAQ&url=https%3A%2F%2Fwanderingwagars.com%2Fhow-to-plan-a-trip-to-maldives%2F&psig=AOvVaw0xpl1Vfk-leXFwdC1FaGjW&ust=1572136539749824",
  # image_three: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwivyZSk17jlAhVDzRoKHYuHCA0QjRx6BAgBEAQ&url=https%3A%2F%2Fwww.cnbc.com%2F2019%2F06%2F05%2Fluxury-maldives-resort-wants-summer-intern-to-help-rescue-sea-turtles.html&psig=AOvVaw0xpl1Vfk-leXFwdC1FaGjW&ust=1572136539749824",
  # image_four: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwisg8-017jlAhWp34UKHU8HB-QQjRx6BAgBEAQ&url=https%3A%2F%2Fbigseventravel.com%2F2019%2F07%2Fnew-maldives-hotel-vakkaru-maldives%2F&psig=AOvVaw0xpl1Vfk-leXFwdC1FaGjW&ust=1572136539749824",
  # departureDate: todayDate,
  # returnDate: todayDate,
  user: raiden,
  group: boys
)

# Holiday.create!(
#   cover_photo: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwip3PCc1rjlAhVNz4UKHV5_CU0QjRx6BAgBEAQ&url=https%3A%2F%2Fwww.lonelyplanet.com%2Fspain%2Fbarcelona&psig=AOvVaw1BgXkV-FWRv6PFtWzxqTMa&ust=1572136290977845",
#   location: "Barcelona, Spain",
#   departureAirport: "LHR",
#   arrivalAirport: "BCN",
#   description: "Paradise for everyone!",
#   attractions: "The beach, the girls and the parties",
#   when_to_go: "May - September",
#   # image_one: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjkuIC11rjlAhWMxoUKHaXfDhgQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.telegraph.co.uk%2Ftravel%2Fdestinations%2Feurope%2Fspain%2Fcatalonia%2Fbarcelona%2Farticles%2Fbarcelona-attractions%2F&psig=AOvVaw2lIqf0lFyqlB3NAxo0qo0s&ust=1572136332525876",
#   # image_two: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiJ1pPH1rjlAhUExhoKHXu1DiwQjRx6BAgBEAQ&url=https%3A%2F%2Fblog.blueairweb.com%2Fbarcelona-guide-tourist-attractions-and-prices%2F%3Flang%3Den&psig=AOvVaw2lIqf0lFyqlB3NAxo0qo0s&ust=1572136332525876",
#   # image_three: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjfkIbO1rjlAhUOLBoKHeE7AcwQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.fodors.com%2Fworld%2Feurope%2Fspain%2Fbarcelona%2Fexperiences%2Fnews%2Fhow-to-skip-the-crowds-and-still-see-barcelonas-top-attractions&psig=AOvVaw2lIqf0lFyqlB3NAxo0qo0s&ust=1572136332525876",
#   # image_four: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjI0trX1rjlAhXExYUKHUMlCOoQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.canuckabroad.com%2Fplaces%2Fplace%2Fbarcelona-spain%2F&psig=AOvVaw2lIqf0lFyqlB3NAxo0qo0s&ust=1572136332525876",
#   # departureDate: todayDate,
#   # returnDate: todayDate,
#   user: raiden,
#   group: boys
# )

# Holiday.create!(
#   cover_photo: "https://www.telegraph.co.uk/travel/destinations/europe/greece/cyclades/mykonos/articles/mykonos-expert-travel-guide/",
#   location: "Mykonos, Greece",
#   departureAirport: "LHR",
#   arrivalAirport: "JMK",
#   description: "Paradise for all!",
#   attractions: "The beach, town, people, lifestyle, etc",
#   when_to_go: "September - October",
#   # image_one: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiaqreK1bjlAhVPxYUKHU3zA0UQjRx6BAgBEAQ&url=https%3A%2F%2Fmykonostraveller.com%2Fmykonos-island%2F&psig=AOvVaw3JMaTzPkOjGCaKh3bMQjmz&ust=1572135847460866",
#   # image_two: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwi2_6-P1bjlAhUtxYUKHdXMDtkQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.greeka.com%2Fcyclades%2Fmykonos%2Fisland-hopping%2F&psig=AOvVaw3JMaTzPkOjGCaKh3bMQjmz&ust=1572135847460866",
#   # image_three: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjI99eZ1bjlAhUExhoKHXu1DiwQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.mykonosgrand.gr%2Fthe-resort%2Fmykonos-island-information%2F&psig=AOvVaw3JMaTzPkOjGCaKh3bMQjmz&ust=1572135847460866",
#   # image_four: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwipk-q01bjlAhWszoUKHWehAAkQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.telegraph.co.uk%2Ftravel%2Fdestinations%2Feurope%2Fgreece%2Fcyclades%2Fmykonos%2Farticles%2Fmykonos-expert-travel-guide%2F&psig=AOvVaw07e0mREwLwCcrhsPnTkCpd&ust=1572136073496175",
#   # departureDate: todayDate,
#   # returnDate: todayDate,
#   user: raiden,
#   group: boys
# )
