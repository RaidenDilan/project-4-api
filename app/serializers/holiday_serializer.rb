class HolidaySerializer < ActiveModel::Serializer
  has_one :user

  has_many :comments
  
  attributes :id, :cover_photo, :location, :attractions, :when_to_go, :description, :image_one, :image_two, :image_three, :image_four, :group_id, :departureDate, :returnDate, :departureAirport, :arrivalAirport
end
