class FixSightingsOutingColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :sightings, :trip_id, :outing_id
  end
end
