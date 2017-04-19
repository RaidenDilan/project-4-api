class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :holidays, :attendee_ids, :attendees
  has_many :attendees
  belongs_to  :creator
end
