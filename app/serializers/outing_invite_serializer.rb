class OutingInviteSerializer < ActiveModel::Serializer
  attributes :id, :inviter_id, :invitee_id, :outing_id
  belongs_to :inviter
  belongs_to :outing
end
