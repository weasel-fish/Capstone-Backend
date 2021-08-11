class CreateOutings < ActiveRecord::Migration[6.1]
  def change
    create_table :outings do |t|
      t.string :name
      t.string :location
      t.datetime :date
      t.text :description
      t.string :image
      t.text :notes

      t.timestamps
    end
  end
end
