class OutingSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :date, :description, :image, :notes
end
