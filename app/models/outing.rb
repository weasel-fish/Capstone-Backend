class Outing < ApplicationRecord
    has_one_attached :image

    has_many :user_outings, dependent: :destroy
    has_many :users, through: :user_outings
    has_many :sightings, dependent: :destroy
    has_many :animals, through: :sightings
    has_many :outing_invites, dependent: :destroy

    validates :date, presence: true
    validates :name, presence: true
end
