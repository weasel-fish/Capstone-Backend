class OutingInvite < ApplicationRecord
    belongs_to :inviter, class_name: "User"
    belongs_to :invitee, class_name: "User"
    belongs_to :outing
    validates :inviter_id, uniqueness: {scope: :invitee_id}
end
