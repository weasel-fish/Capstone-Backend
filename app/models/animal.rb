class Animal < ApplicationRecord

    has_many :wish_list_animals
    has_many :sightings

    validates :common_name, presence: true
end
