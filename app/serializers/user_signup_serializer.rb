class UserSignupSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes :id, :username, :address
    has_many :followers
    has_many :followees
    has_many :outings
    has_many :alerts
    has_many :wishes
  
  #PRE-AVATAR serializer, WAIT DOES THIS EVEN NEED ANYTHING OTHER THAN AN ID?
  #OBSOLETE?

    def wishes
      wishes = object.wish_list_animals
      wishes
    end
  end