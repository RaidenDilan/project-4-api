class AddGroupToHolidays < ActiveRecord::Migration[5.0]
  def change
    add_reference :holidays, :group, foreign_key: true
  end
end
