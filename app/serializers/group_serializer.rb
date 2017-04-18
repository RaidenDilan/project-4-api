class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to  :creator
end
