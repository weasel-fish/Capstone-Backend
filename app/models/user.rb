class User < ApplicationRecord
    has_secure_password

    has_many :outing_invites, foreign_key: :invitee_id
    has_many :wish_list_animals
    
    has_many :received_follows, foreign_key: :followee_id, class_name: "Follow"
    has_many :followers, through: :received_follows, source: :follower

    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
    has_many :followees, through: :given_follows, source: :followee

    has_many :user_outings
    has_many :outings, through: :user_outings

    has_many :alerts

    validates :username, :address, uniqueness: true
end
