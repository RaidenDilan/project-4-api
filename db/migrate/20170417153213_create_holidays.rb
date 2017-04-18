class CreateHolidays < ActiveRecord::Migration[5.0]
  def change
    create_table :holidays do |t|
      t.string :cover_photo
      t.string :location
      t.string :nearest_airport
      t.string :attractions
      t.string :when_to_go
      t.text :description
      t.string :image_one
      t.string :image_two
      t.string :image_three
      t.string :image_four
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
