class Sighting < ApplicationRecord
    has_one_attached :image
    
    belongs_to :outing
    belongs_to :animal
    has_many :alerts

    validates :outing_id, uniqueness: {scope: :animal_id}
end
