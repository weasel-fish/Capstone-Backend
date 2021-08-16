class WishListAnimalSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :animal_id
  attribute :animal

  def animal
    animal = object.animal
    animal
  end
end
