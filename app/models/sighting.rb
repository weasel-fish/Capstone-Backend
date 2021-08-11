class Sighting < ApplicationRecord
    belongs_to :trip
    belongs_to :animal
    has_many :alerts
end
