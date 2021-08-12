class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :address, :avatar
  has_many :followers
  has_many :followees
  has_many :outings
end
