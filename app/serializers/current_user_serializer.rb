class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :address, :avatar
  has_many :followers
  has_many :followees
  has_many :outings
  has_many :alerts
  has_many :wishes

  def wishes
    wishes = object.wish_list_animals
    wishes
  end
end
