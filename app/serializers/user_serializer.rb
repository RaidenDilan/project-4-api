class UserSerializer < ActiveModel::Serializer
  has_many :holidays
  attributes :id, :username, :image, :full_name, :first_name, :last_name, :email, :password, :airport, :bio

  # def image_src
  #   object.image.url
  # end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
