class Outing < ApplicationRecord
    has_many :user_outings
    has_many :users, through: :user_outings
    has_many :sightings
    has_many :animals, through: :sightings
    has_many :outing_invites
end
