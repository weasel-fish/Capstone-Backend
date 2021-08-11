class SightingSerializer < ActiveModel::Serializer
  attributes :id, :animal_id, :trip_id, :environment, :weather_conditions, :notes
end
