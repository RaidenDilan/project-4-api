class CreateHolidays < ActiveRecord::Migration[5.0]
  def change
    create_table :holidays do |t|
      t.string :image
      t.string :location
      t.string :nearest_airport
      t.string :attractions
      t.string :when_to_go
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
