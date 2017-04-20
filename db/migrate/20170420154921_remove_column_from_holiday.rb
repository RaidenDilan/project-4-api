class RemoveColumnFromHoliday < ActiveRecord::Migration[5.0]
  def change
    remove_column :holidays, :nearest_airport, :string
  end
end
