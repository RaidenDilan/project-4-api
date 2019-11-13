class HolidaySerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :group
  has_many :comments

  attributes :id, :image_src, :location, :attractions, :when_to_go, :departureDate, :returnDate, :departureAirport, :arrivalAirport, :group_id, :user_id

  def image_src
    object.image.url
  end
end
