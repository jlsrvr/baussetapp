require "time"

puts 'creating user 1(admin)..'
user1 = User.new
user1.email = 'julesriv@gmail.com'
user1.password = 'jules123'
user1.first_name = 'Jules'
user1.last_name = 'Rivoire'
user1.admin = true
user1.save!
puts 'user 1 created !'

puts 'creating user 2 who you can send emails to..'
user2 = User.new
user2.email = 'frenchy.rivoire@gmail.com'
user2.password = 'frenchy1'
user2.first_name = 'Julio'
user2.last_name = 'Betham'
user2.save!
puts 'user 2 created !'

puts 'creating user 3..'
user3 = User.new
user3.email = 'jeanno@pacha.com'
user3.password = 'jeanno123'
user3.first_name = 'Jean-Noel'
user3.last_name = 'Rivoire'
user3.save!
puts 'user 3 created !'

puts 'creating user 4..'
user4 = User.new
user4.email = 'lucas@rivoire.com'
user4.password = 'lucas123'
user4.first_name = 'Lucas'
user4.last_name = 'Rivoire'
user4.save!
puts 'user 4 created !!'


puts 'creating Rue Bausset..'
location = Location.new
location.name = 'Le Palace Parisien'
location.address = '17 Rue Bausset, 75015, Paris'
location.user = User.find(1)
location.save!
puts "#{location.name} created !!"

puts 'creating Urrugne..'
location = Location.new
location.name = 'Les Collines Basques'
location.address = "422 Chemin d'Oxabiakoborda, 64122, Urrugne"
location.user = User.find(1)
location.save!
puts "#{location.name} created !!"

puts 'Making the beds at rue bausset'
puts 'Bureau1'
bureau = Bed.new
bureau.size = 1
bureau.location = Location.find(1)
bureau.name = 'Bureau1'
bureau.save!

puts 'Bureau2'
bureau2 = Bed.new
bureau2.size = 1
bureau2.location = Location.find(1)
bureau2.name = 'Bureau2'
bureau2.save!

puts 'En-Suite'
en_suite = Bed.new
en_suite.size = 2
en_suite.location = Location.find(1)
en_suite.name = 'En-Suite'
en_suite.save!

puts 'Chambre'
chambre = Bed.new
chambre.size = 2
chambre.location = Location.find(1)
chambre.name = 'Chambre'
chambre.save!

puts 'Salon'
salon = Bed.new
salon.size = 2
salon.location = Location.find(1)
salon.name = 'salon'
salon.save!

puts 'All 8 beds have been made at Rue Bausset'

puts "Creating two bookings"

booking = Booking.new
booking.start_date = Date.new(2019, 12, 8)
booking.end_date = Date.new(2019, 12, 15)
booking.message = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste, vero."
booking.user = User.find(2)
booking.location = Location.first
booking.place = 4
booking.save!

puts "Booking for #{booking.user.first_name} created in the future(#{booking.start_date})"

booking = Booking.new
booking.start_date = Date.new(2019, 8, 8)
booking.end_date = Date.new(2019, 8, 15)
booking.message = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste, vero."
booking.user = User.find(4)
booking.location = Location.first
booking.place = 3
booking.status = "accepted"
booking.save!

puts "Booking for #{booking.user.first_name} created in the future(#{booking.start_date})"

puts "Creating a bed combinations for #{booking.user.first_name}"

combination = Combination.new
combination.booking = Booking.find(2)
combination.bed = Bed.find(2)
combination.save!

puts "tu dors dans #{combination.bed.name}"

combination = Combination.new
combination.booking = Booking.find(2)
combination.bed = Bed.find(3)
combination.save!

puts "tu dors dans #{combination.bed.name}"

puts 'You\'re ready to play around with your db'



