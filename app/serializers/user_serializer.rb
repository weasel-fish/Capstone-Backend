class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username
  # attribute :avatar

  # def avatar
  #   # variant = object.avatar.variant(resize: "100x100")
  #   # return rails_representation_url(variant, only_path: true)
  #   rails_blob_path(object.avatar, only_path: true)
  # end
end
