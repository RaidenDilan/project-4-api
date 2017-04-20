class AddDepartureDateToHoliday < ActiveRecord::Migration[5.0]
  def change
    add_column :holidays, :departureDate, :date
  end
end
