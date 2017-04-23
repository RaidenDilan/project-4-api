class CommentSerializer < ActiveModel::Serializer
  has_one :user
  has_one :holiday
  attributes :id, :body, :user
end
