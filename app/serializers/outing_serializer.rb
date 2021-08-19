class OutingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :location, :date, :description, :notes
  has_many :users
  has_many :outing_invites
  has_many :sightings
  attribute :image

  def image
    variant = object.image.variant(resize: "100x100")
    return rails_representation_url(variant, only_path: true)
    # rails_blob_path(object.avatar, only_path: true)
  end
end
