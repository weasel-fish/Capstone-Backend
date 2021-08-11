class CreateSightings < ActiveRecord::Migration[6.1]
  def change
    create_table :sightings do |t|
      t.integer :animal_id
      t.integer :trip_id
      t.string :environment
      t.string :weather_conditions
      t.string :notes

      t.timestamps
    end
  end
end
