class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :address, :avatar
  has_many :followers
  has_many :followees
end
