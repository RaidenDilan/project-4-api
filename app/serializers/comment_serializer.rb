class CommentSerializer < ActiveModel::Serializer
  has_one :user
  has_one :holiday

  attributes :id, :body, :created_at, :user, :holiday

  # private
  #   def comment_time
  #     created_at.strftime("%d/%m/%y at %l:%M %p")
  #     # object.created_at.strftime("%d/%m/%y at %l:%M %p")
  #   end
end
