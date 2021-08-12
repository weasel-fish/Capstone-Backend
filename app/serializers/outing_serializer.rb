class OutingSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :date, :description, :image, :notes
  has_many :users
  has_many :outing_invites
end
