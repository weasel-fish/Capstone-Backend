class CreateWishListAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :wish_list_animals do |t|
      t.integer :user_id
      t.integer :animal_id

      t.timestamps
    end
  end
end
