class AddArrivalDateToHoliday < ActiveRecord::Migration[5.0]
  def change
    add_column :holidays, :returnDate, :date
  end
end
