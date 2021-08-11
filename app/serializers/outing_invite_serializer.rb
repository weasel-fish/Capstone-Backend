class OutingInviteSerializer < ActiveModel::Serializer
  attributes :id, :inviter_id, :invitee_id, :outing_id
end
