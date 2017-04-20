class AddDepartureAirportToHoliday < ActiveRecord::Migration[5.0]
  def change
    add_column :holidays, :departureAirport, :string
  end
end
