class UserSerializer < ActiveModel::Serializer
  has_many :groups
  attributes :id, :username, :email, :image_src, :airport, :groups

  def image_src
    object.image.url
  end
end
