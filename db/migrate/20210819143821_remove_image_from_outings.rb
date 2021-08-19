class RemoveImageFromOutings < ActiveRecord::Migration[6.1]
  def change
    remove_column :outings, :image
  end
end
