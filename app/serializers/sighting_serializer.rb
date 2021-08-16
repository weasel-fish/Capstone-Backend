class SightingSerializer < ActiveModel::Serializer
  attributes :id, :animal_id, :outing_id, :environment, :weather_conditions, :notes
  # belongs_to :animal
  attribute :animal

  def animal
    animal = Animal.find_by(id: object[:animal_id])
    animal
  end
end
