class GroupSerializer < ActiveModel::Serializer
  has_many :attendees
  belongs_to :creator
  has_many :holidays

  attributes :id, :name, :holidays, :attendee_ids
end
