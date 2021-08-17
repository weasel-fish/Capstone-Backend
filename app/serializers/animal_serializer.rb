class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :common_name, :scientific_name, :description
end
