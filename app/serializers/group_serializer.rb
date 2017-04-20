class GroupSerializer < ActiveModel::Serializer
  has_many :attendees
  belongs_to  :creator

  # filter insomnia preview here
  attributes :id, :name, :holidays, :attendee_ids
end
