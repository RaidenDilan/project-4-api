class CommentSerializer < ActiveModel::Serializer
  has_one :user
  has_one :holiday

  attributes :id, :body, :created_at, :user, :holiday

  private
    def comment_time
      created_at.strftime("%Y/%m/%d")
      # object.created_at.strftime("%Y/%m/%d")
    end
end
