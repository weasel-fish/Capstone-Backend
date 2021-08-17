class WishListAnimalSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :animal_id
  attribute :animal

  def animal
    animal = object.animal
    {common_name: animal[:common_name], scientific_name: animal[:scientific_name], description: animal[:description]}
  end
end
