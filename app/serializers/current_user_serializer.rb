class CurrentUserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :address
  has_many :followers
  has_many :followees
  has_many :outings
  has_many :alerts
  has_many :wishes
  attribute :avatar

  def avatar
    variant = object.avatar.variant(resize: "150x150")
    return rails_representation_url(variant, only_path: true)
    # rails_blob_path(object.avatar, only_path: true)
  end

  def wishes
    wishes = object.wish_list_animals
    wishes
  end
end
