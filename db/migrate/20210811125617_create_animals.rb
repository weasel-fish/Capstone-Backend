class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :common_name
      t.string :scientific_name
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
