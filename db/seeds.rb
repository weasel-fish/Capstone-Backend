# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Clearing old data'
Alert.destroy_all
Alert.reset_pk_sequence
Animal.destroy_all
Animal.reset_pk_sequence
Follow.destroy_all
Follow.reset_pk_sequence
OutingInvite.destroy_all
OutingInvite.reset_pk_sequence
Outing.destroy_all
Outing.reset_pk_sequence
Sighting.destroy_all
Sighting.reset_pk_sequence
UserOuting.destroy_all
UserOuting.reset_pk_sequence
User.destroy_all
User.reset_pk_sequence
WishListAnimal.destroy_all
WishListAnimal.reset_pk_sequence

puts 'Clearing old data done'

puts 'Generating user and avatar data...'
# 1
kyle = User.create(username: "Kyle", address: 'kyle@gmail.com', password: '123')
kyle.avatar.attach(
    io: File.open('./public/avatars/kyle.png'),
    filename: 'kyle.png',
    content_type: 'application/png'
)
# 2
bf = User.create(username: "bugfan43", address: 'bugfan@gmail.com', password: '123')
bf.avatar.attach(
    io: File.open('./public/avatars/woman.png'),
    filename: 'woman.png',
    content_type: 'application/png'
)
# 3
bob = User.create(username: "bobthebugman", address: 'bob@gmail.com', password: '123')
bob.avatar.attach(
    io: File.open('./public/avatars/man.png'),
    filename: 'man.png',
    content_type: 'application/png'
)
# 4
legs = User.create(username: "2manylegs2count", address: 'legs@gmail.com', password: '123')
legs.avatar.attach(
    io: File.open('./public/avatars/boy.png'),
    filename: 'boy.png',
    content_type: 'application/png'
)
# 5
ilike = User.create(username: 'ilikebugs7', address: 'ILB2@gmail.com', password: '123')
ilike.avatar.attach(
    io: File.open('./public/avatars/woman.png'),
    filename: 'boy.png',
    content_type: 'application/png'
)
# 6
wasp = User.create(username: 'H_Pym', address: 'waspnet@gmail.com', password: '123')
wasp.avatar.attach(
    io: File.open('./public/avatars/wasp.png'),
    filename: 'wasp.png',
    content_type: 'application/png'
)
# 7
bb = User.create(username: 'Beetle Bro', address: 'beetle@gmail.com', password: '123')
bb.avatar.attach(
    io: File.open('./public/avatars/boy.png'),
    filename: 'boy.png',
    content_type: 'application/png'
)
# 8
df = User.create(username: 'damselfly94', address: 'df94@gmail.com', password: '123')
df.avatar.attach(
    io: File.open('./public/avatars/boy.png'),
    filename: 'boy.png',
    content_type: 'application/png'
)
# 9
nr = User.create(username: 'NatRom', address: 'scarjo@gmail.com', password: '123')
nr.avatar.attach(
    io: File.open('./public/avatars/scarjo.png'),
    filename: 'scarjo.png',
    content_type: 'application/png'
)
# 10
pp = User.create(username: 'pparker', address: 'webslinger@gmail.com', password: '123')
pp.avatar.attach(
    io: File.open('./public/avatars/pparker.png'),
    filename: 'pparker.png',
    content_type: 'application/png'
)
# 11
tick = User.create(username: 'the_tick', address: 'ticktock@gmail.com', password: '123')
tick.avatar.attach(
    io: File.open('./public/avatars/tick.png'),
    filename: 'tick.png',
    content_type: 'application/png'
)
# 12
ant = User.create(username: 'ScottL', address: 'tinydude@gmail.com', password: '123')
ant.avatar.attach(
    io: File.open('./public/avatars/scottl.png'),
    filename: 'scottl.png',
    content_type: 'application/png'
)
# 13
beea = User.create(username: 'Bee-atrix', address: 'bee@gmail.com', password: '123')
beea.avatar.attach(
    io: File.open('./public/avatars/bee.png'),
    filename: 'bee.png',
    content_type: 'application/png'
)
# 14
cic = User.create(username: 'CicadaChick', address: 'zzzZZZ@gmail.com', password: '123')
cic.avatar.attach(
    io: File.open('./public/avatars/boy.png'),
    filename: 'boy.png',
    content_type: 'application/png'
)
# 15
chc = User.create(username: 'chitinousChris', address: 'cc@gmail.com', password: '123')
chc.avatar.attach(
    io: File.open('./public/avatars/boy.png'),
    filename: 'boy.png',
    content_type: 'application/png'
)

puts 'User and Avatar data done'

puts 'Generating follows'
Follow.create(follower_id: 1, followee_id: 8)
Follow.create(follower_id: 1, followee_id: 15)
Follow.create(follower_id: 1, followee_id: 12)
Follow.create(follower_id: 1, followee_id: 7)
Follow.create(follower_id: 1, followee_id: 10)
Follow.create(follower_id: 1, followee_id: 14)
Follow.create(follower_id: 14, followee_id: 1)
Follow.create(follower_id: 8, followee_id: 1)
Follow.create(follower_id: 13, followee_id: 1)
Follow.create(follower_id: 7, followee_id: 1)
Follow.create(follower_id: 2, followee_id: 3)
Follow.create(follower_id: 2, followee_id: 4)
Follow.create(follower_id: 2, followee_id: 5)
Follow.create(follower_id: 3, followee_id: 2)
Follow.create(follower_id: 3, followee_id: 4)
Follow.create(follower_id: 3, followee_id: 5)
Follow.create(follower_id: 4, followee_id: 2)
Follow.create(follower_id: 4, followee_id: 3)
Follow.create(follower_id: 4, followee_id: 5)
Follow.create(follower_id: 5, followee_id: 2)
Follow.create(follower_id: 5, followee_id: 3)
Follow.create(follower_id: 5, followee_id: 4)
Follow.create(follower_id: 6, followee_id: 12)
Follow.create(follower_id: 6, followee_id: 9)
Follow.create(follower_id: 7, followee_id: 3)
Follow.create(follower_id: 7, followee_id: 11)
Follow.create(follower_id: 7, followee_id: 14)
Follow.create(follower_id: 8, followee_id: 13)
Follow.create(follower_id: 8, followee_id: 15)
Follow.create(follower_id: 8, followee_id: 14)
Follow.create(follower_id: 9, followee_id: 6)
Follow.create(follower_id: 9, followee_id: 10)
Follow.create(follower_id: 9, followee_id: 12)
Follow.create(follower_id: 9, followee_id: 13)
Follow.create(follower_id: 10, followee_id: 6)
Follow.create(follower_id: 10, followee_id: 12)
Follow.create(follower_id: 10, followee_id: 9)
Follow.create(follower_id: 10, followee_id: 1)
Follow.create(follower_id: 11, followee_id: 14)
Follow.create(follower_id: 11, followee_id: 15)
Follow.create(follower_id: 11, followee_id: 3)
Follow.create(follower_id: 12, followee_id: 6)
Follow.create(follower_id: 12, followee_id: 9)
Follow.create(follower_id: 12, followee_id: 10)
Follow.create(follower_id: 13, followee_id: 4)
Follow.create(follower_id: 13, followee_id: 8)
Follow.create(follower_id: 13, followee_id: 14)
Follow.create(follower_id: 14, followee_id: 13)
Follow.create(follower_id: 14, followee_id: 4)
Follow.create(follower_id: 14, followee_id: 7)
Follow.create(follower_id: 15, followee_id: 8)
Follow.create(follower_id: 15, followee_id: 2)
Follow.create(follower_id: 15, followee_id: 11)

puts 'Follows done'

puts 'Generating bugs'
# 1
Animal.create(common_name: 'Mediterranean Black Widow', scientific_name: 'Latrodectus tredecimguttatus', description: 'Black in color, similar to most other widow species, and is identified by the thirteen spots which are found on its dorsal abdomen (the species name is Latin for "with thirteen spots")')
# 2
Animal.create(common_name: 'Banana Slug', scientific_name: 'Ariolimax californicus', description: 'Banana slugs are often bright yellow (giving rise to the banana nomenclature) although they may also be greenish, brown, tan, or white.')
# 3
Animal.create(common_name: 'Hummingbird Hawk-Moth', scientific_name: 'Macroglossum stellatarum', description: 'Named for its similarity to hummingbirds, they feed on the nectar of tube-shaped flowers using their long proboscis while hovering in the air')
# 4
Animal.create(common_name: 'Spicebush Swallowtail', scientific_name: 'Papilio troilus', description: 'Adults are primarily black/brown in color, with a trademark green-blue (male) or bright blue (female) splotch in the shape of a half moon on the hindwings.')
# 5
Animal.create(common_name: 'Ensign Wasp', scientific_name: 'multiple', description: 'These wasps wave their little butts in the air! They also lay their eggs in cockroaches.')
# 6
Animal.create(common_name: 'Cicada Killer', scientific_name: 'Sphecius speciosus', description: 'Adult eastern cicada wasps are large, 1.5 to 5.0 cm (0.6 to 2.0 in) long, robust wasps with hairy, reddish, and black areas on their thoraces (middle parts), and black to reddish brown abdominal (rear) segments that are marked with light yellow stripes.')
# 7
Animal.create(common_name: 'Eciton Army Ant', scientific_name: 'Eciton burchellii', description: 'Workers are also adept at making living structures out of their own bodies to improve efficiency of moving as a group across the forest floor while foraging or emigrating. Workers can fill "potholes" in the foraging trail with their own bodies,[7] and can also form living bridges.')
# 8
Animal.create(common_name: 'Indian Stick Insect', scientific_name: 'Carausius morosus', description: 'This insect looks like a stick!')
# 9
Animal.create(common_name: 'Blue Dasher Dragonfly', scientific_name: 'Pachydiplax longipennis', description: 'Adult males have a chalky, blue color from head to abdomen that ends with a black tip. Their heads contain their large eyes which take on a metallic sheen in certain lighting.')
# 10
Animal.create(common_name: 'Black and Yellow Garden Spider', scientific_name: 'Argiope aurantia', description: 'It has distinctive yellow and black markings on the abdomen and a mostly white cephalothorax. Its scientific Latin name translates to "gilded silver-face".')
# 11
Animal.create(common_name: 'Polyphemus Moth', scientific_name: 'Antheraea polyphemus', description: 'The most notable feature of the moth is its large, purplish eyespots on its two hindwings. The eyespots give it its name – from the Greek myth of the cyclops Polyphemus.')
# 12
Animal.create(common_name: 'Orchid Mantis', scientific_name: 'Hymenopus coronatus', description: 'This species mimics parts of the orchid flower. The four walking legs resemble flower petals, and the toothed front pair is used as in other mantises for grasping prey.')
# 13
Animal.create(common_name: 'Green Sweat Bee', scientific_name: 'Augochlora pura', description: 'Their entire bodies are a shiny, bright green.')
puts 'Bugs done'

puts 'Generating wishes'
WishListAnimal.create(user_id: 1, animal_id: 8)
WishListAnimal.create(user_id: 1, animal_id: 12)
WishListAnimal.create(user_id: 1, animal_id: 7)
WishListAnimal.create(user_id: 1, animal_id: 4)
WishListAnimal.create(user_id: 1, animal_id: 1)
WishListAnimal.create(user_id: 2, animal_id: 6)
WishListAnimal.create(user_id: 2, animal_id: 8)
WishListAnimal.create(user_id: 3, animal_id: 11)
WishListAnimal.create(user_id: 3, animal_id: 3)
WishListAnimal.create(user_id: 3, animal_id: 2)
WishListAnimal.create(user_id: 4, animal_id: 13)
WishListAnimal.create(user_id: 4, animal_id: 6)
WishListAnimal.create(user_id: 5, animal_id: 9)
WishListAnimal.create(user_id: 6, animal_id: 5)
WishListAnimal.create(user_id: 6, animal_id: 6)
WishListAnimal.create(user_id: 6, animal_id: 3)
WishListAnimal.create(user_id: 7, animal_id: 10)
WishListAnimal.create(user_id: 7, animal_id: 7)
WishListAnimal.create(user_id: 8, animal_id: 3)
WishListAnimal.create(user_id: 8, animal_id: 13)
WishListAnimal.create(user_id: 8, animal_id: 6)
WishListAnimal.create(user_id: 9, animal_id: 1)
WishListAnimal.create(user_id: 9, animal_id: 7)
WishListAnimal.create(user_id: 10, animal_id: 10)
WishListAnimal.create(user_id: 10, animal_id: 1)
WishListAnimal.create(user_id: 10, animal_id: 4)
WishListAnimal.create(user_id: 11, animal_id: 2)
WishListAnimal.create(user_id: 11, animal_id: 6)
WishListAnimal.create(user_id: 11, animal_id: 9)
WishListAnimal.create(user_id: 11, animal_id: 13)
WishListAnimal.create(user_id: 12, animal_id: 7)
WishListAnimal.create(user_id: 12, animal_id: 3)
WishListAnimal.create(user_id: 13, animal_id: 10)
WishListAnimal.create(user_id: 13, animal_id: 12)
WishListAnimal.create(user_id: 13, animal_id: 3)
WishListAnimal.create(user_id: 14, animal_id: 9)
WishListAnimal.create(user_id: 15, animal_id: 5)
WishListAnimal.create(user_id: 15, animal_id: 13)

puts 'Wishes done'

puts 'Generating outings, attendees, and sightings'

outing1 = Outing.create(name: "Gertrude's Nose Hike", location: 'Minnewaska State Park, NY', date: '2021-08-11', description: "Solo hike.", notes: 'Weather was nice')

outing1.image.attach(
    io: File.open('./public/outing_images/minnewaska.jpg'),
    filename: 'minnewaska.jpg',
    content_type: 'application/jpg'
)

UserOuting.create(user_id: 1, outing_id: 1)


outing2 = Outing.create(name: 'Marvelous Day Out', location: 'Central Park, NYC', date: '2021-07-27', description: 'We spent the day in the park, found a lot of cool bugs!', notes: 'Fought some baddies, too')

outing2.image.attach(
    io: File.open('./public/outing_images/central.jpg'),
    filename: 'central.jpg',
    content_type: 'application/jpg'
)
UserOuting.create(user_id: 6, outing_id: 2)
UserOuting.create(user_id: 9, outing_id: 2)
UserOuting.create(user_id: 10, outing_id: 2)
UserOuting.create(user_id: 12, outing_id: 2)

outing3 = Outing.create(name: 'Giant Ledge Hike', location: 'Panther Mountain', date: '2021-06-15', description: 'Full, day-long hike. It was strenuous, but the view at the end payed off! We saw some cool bugs along the way.')

outing3.image.attach(
    io: File.open('./public/outing_images/gledge.jpg'),
    filename: 'gledge.jpg',
    content_type: 'application/jpg'
)

UserOuting.create(user_id: 15, outing_id: 3)
UserOuting.create(user_id: 14, outing_id: 3)
UserOuting.create(user_id: 13, outing_id: 3)
UserOuting.create(user_id: 8, outing_id: 3)
UserOuting.create(user_id: 7, outing_id: 3)

puts 'Outings and attendees done'


puts 'Generating sightings'
sighting1 = Sighting.create(animal_id: 13, outing_id:1)
sighting1.image.attach(
    io: File.open('./public/sighting_images/sweat_bee.jpg'),
    filename: 'sweat_bee.jpg',
    content_type: 'application/jpg'
)

sighting2 = Sighting.create(animal_id: 3, outing_id:1)
sighting2.image.attach(
    io: File.open('./public/sighting_images/humbirdmoth.jpg'),
    filename: 'humbirdmoth.jpg',
    content_type: 'application/jpg'
)

sighting3 = Sighting.create(animal_id: 11, outing_id:1)
sighting3.image.attach(
    io: File.open('./public/sighting_images/polyphemus.jpeg'),
    filename: 'polyphemus.jpeg',
    content_type: 'application/jpeg'
)

sighting4 = Sighting.create(animal_id: 2, outing_id:2)
sighting4.image.attach(
    io: File.open('./public/sighting_images/bananaslug.jpg'),
    filename: 'bananaslug.jpg',
    content_type: 'application/jpg'
)

sighting5 = Sighting.create(animal_id: 4, outing_id:2)
sighting5.image.attach(
    io: File.open('./public/sighting_images/spicebush.jpeg'),
    filename: 'spicebush.jpeg',
    content_type: 'application/jpeg'
)

sighting6 = Sighting.create(animal_id: 6, outing_id:2)
sighting6.image.attach(
    io: File.open('./public/sighting_images/cicadakiller.jpg'),
    filename: 'cicadakiller.jpg',
    content_type: 'application/jpg'
)

sighting7 = Sighting.create(animal_id: 9, outing_id:2)
sighting7.image.attach(
    io: File.open('./public/sighting_images/bluedasher.jpeg'),
    filename: 'bluedasher.jpeg',
    content_type: 'application/jpeg'
)

sighting8 = Sighting.create(animal_id: 1, outing_id:3)
sighting8.image.attach(
    io: File.open('./public/sighting_images/medblackwidow.jpeg'),
    filename: 'medblackwidow.jpeg',
    content_type: 'application/jpeg'
)

sighting9 = Sighting.create(animal_id: 5, outing_id:3)
sighting9.image.attach(
    io: File.open('./public/sighting_images/ensignwasp.jpeg'),
    filename: 'ensignwasp.jpeg',
    content_type: 'application/jpeg'
)

sighting10 = Sighting.create(animal_id: 7, outing_id:3)
sighting10.image.attach(
    io: File.open('./public/sighting_images/armyant.jpeg'),
    filename: 'armyant.jpeg',
    content_type: 'application/jpeg'
)

sighting11 = Sighting.create(animal_id: 8, outing_id:3)
sighting11.image.attach(
    io: File.open('./public/sighting_images/stickinsect.jpeg'),
    filename: 'stickinsect.jpeg',
    content_type: 'application/jpeg'
)

puts 'Sightings done'

puts 'Generating alerts'

Alert.create(user_id: 1, sighting_id: 10)
Alert.create(user_id: 1, sighting_id: 11)
Alert.create(user_id: 1, sighting_id: 8)

puts 'Alerts done'

puts 'Seeding done!'
