class AddArrivalAirportToHoliday < ActiveRecord::Migration[5.0]
  def change
    add_column :holidays, :arrivalAirport, :string
  end
end
