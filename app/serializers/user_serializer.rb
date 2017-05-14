class UserSerializer < ActiveModel::Serializer
  has_many :holidays
  has_many :groups_created
  has_many :groups_attending

  attributes :id, :username, :image_src, :full_name, :first_name, :last_name, :email, :password, :airport, :bio, :groups_created, :comments 

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def image_src
    object.image.url
  end
end
