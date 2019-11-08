class UserSerializer < ActiveModel::Serializer
  has_many :groups
  # has_many :groups_created
  # has_many :groups_attending

  attributes :id, :username, :email, :image_src, :airport, :bio, :groups

  def image_src
    object.image.url
    # p object.image
  end
end
