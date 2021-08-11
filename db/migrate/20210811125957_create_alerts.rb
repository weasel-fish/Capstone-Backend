class CreateAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :alerts do |t|
      t.integer :user_id
      t.integer :sighting_id

      t.timestamps
    end
  end
end
