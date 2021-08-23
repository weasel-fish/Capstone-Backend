class WishListAnimal < ApplicationRecord
    belongs_to :user
    belongs_to :animal
    validates :animal_id, uniqueness: {scope: :user_id, message: 'is already on your wishlist.'}
end
