class HolidaySerializer < ActiveModel::Serializer
  has_one :user
  attributes :id, :cover_photo, :location, :nearest_airport, :attractions, :when_to_go, :description, :image_one, :image_two, :image_three, :image_four, :group_id
end
