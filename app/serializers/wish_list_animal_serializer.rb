class WishListAnimalSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :animal_id
end
