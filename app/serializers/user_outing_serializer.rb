class UserOutingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :outing_id
  belongs_to :outing
end
