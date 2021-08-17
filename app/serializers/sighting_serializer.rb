class SightingSerializer < ActiveModel::Serializer
  attributes :id, :environment, :weather_conditions, :notes
  # belongs_to :animal
  #:animal_id, :outing_id,
  attribute :animal

  def animal
    animal = Animal.find_by(id: object[:animal_id])
    # animal
    animal[:common_name]
  end
end
