class GroupSerializer < ActiveModel::Serializer
  belongs_to :creator

  has_many :attendees
  has_many :holidays

  attributes :id, :name, :holidays, :attendee_ids
end
