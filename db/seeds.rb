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
