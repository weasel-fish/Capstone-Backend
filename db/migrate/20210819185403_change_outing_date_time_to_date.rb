class ChangeOutingDateTimeToDate < ActiveRecord::Migration[6.1]
  def change
    change_column :outings, :date, :date
  end
end
