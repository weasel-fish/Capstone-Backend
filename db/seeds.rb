# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

User.create(username: "Kyle", address: 'kyle@gmail.com', password: '123')
User.create(username: "Jane", address: 'jane@gmail.com', password: '123')
User.create(username: "Bob", address: 'bob@gmail.com', password: '123')
User.create(username: "Sally", address: 'sally@gmail.com', password: '123')

Follow.create(follower_id: 1, followee_id: 2)
Follow.create(follower_id: 1, followee_id: 3)
Follow.create(follower_id: 4, followee_id: 1)
Follow.create(follower_id: 4, followee_id: 2)

Animal.create(common_name: 'Mediterranean Black Widow', scientific_name: 'Latrodectus tredecimguttatus', description: 'Black in color, similar to most other widow species, and is identified by the thirteen spots which are found on its dorsal abdomen (the species name is Latin for "with thirteen spots")')
Animal.create(common_name: 'Banana Slug', scientific_name: 'Ariolimax californicus', description: 'Banana slugs are often bright yellow (giving rise to the banana nomenclature) although they may also be greenish, brown, tan, or white.')
Animal.create(common_name: 'Hummingbird Hawk-Moth', scientific_name: 'Macroglossum stellatarum', description: 'Named for its similarity to hummingbirds, they feed on the nectar of tube-shaped flowers using their long proboscis while hovering in the air')
Animal.create(common_name: 'Spicebush Swallowtail', scientific_name: 'Papilio troilus', description: 'Adults are primarily black/brown in color, with a trademark green-blue (male) or bright blue (female) splotch in the shape of a half moon on the hindwings.')
Animal.create(common_name: 'Ensign Wasp', scientific_name: 'multiple', description: 'These wasps wave their little butts in the air! They also lay their eggs in cockroaches.')

Outing.create(name: 'Bike Trail Walk', location: 'Woods Hole/Falmouth Bike Trail', date: '08/12/2021', description: "I'm taking a leisurely walk along the nearby bike path.")
Outing.create(name: 'Panther Mountain Hike', location: 'Panther Mountain, NY', date: '06/23/2021', description: 'Day trip to Panther Mountain with some friends.')
Outing.create(name: 'Morning at the Beach', location: 'Bill Baggs National Park', date: '7/29/2021', description: 'Natalia and I hang out at the beach.')

UserOuting.create(user_id: 1, outing_id: 1)
UserOuting.create(user_id: 1, outing_id: 2)
UserOuting.create(user_id: 1, outing_id: 3)