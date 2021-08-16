class Sighting < ApplicationRecord
    belongs_to :outing
    belongs_to :animal
    has_many :alerts
end
