class SightingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :environment, :weather_conditions, :notes
  # belongs_to :animal
  #:animal_id, :outing_id,
  attribute :animal
  attribute :image

  def image
    byebug
    variant = object.image.variant(resize: "100x100")
    return rails_representation_url(variant, only_path: true)
    # rails_blob_path(object.avatar, only_path: true)
  end

  def animal
    animal = Animal.find_by(id: object[:animal_id])
    # animal
    animal[:common_name]
  end
end
